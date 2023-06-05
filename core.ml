open Format
open Syntax
open Support.Error
open Support.Pervasive


(* ------------------------   EVALUATION  ------------------------ *)

(*let rec isval ctx t = match t with
TmEnd(_, _) -> true
  | _ -> false*)


exception NoRuleApplies

(*let rec reducible t = match t with
    TmEnd _ -> false
    | TmNew (fi, name, sub) -> reducible sub
    | TmSend (fi, name, payload, sub) -> false
    | TmRecv (fi, name, bound, sub) -> false
    | TmPar (fi, sub1, sub2) -> (match (sub1, sub2) with 
        _ when reducible sub1 || reducible sub2 -> true
        | TmSend(fi2, c1, payload, sub1), TmRecv(fi3, c2, bound, sub2) when (c1=c2) ->  true
        | *)

let rec notIn s pt = match pt with
    TmEnd _ -> true
    | TmNew (fi, name, sub) -> s != name && notIn s sub
    | TmSend (fi, name, payload, sub) -> s !=name && s != payload && (notIn s sub)
    | TmRecv (fi, name, bound, sub) -> s !=name && s != bound && (notIn s sub)
    | TmPar (fi, sub1, sub2) -> (notIn s sub1) && (notIn s sub2)
    | TmRepl (fi, name, bound, sub) -> s !=name && s != bound && (notIn s sub)
let rec eval1 ctx t = match t with
     TmNew (_, _, TmEnd(fi2, n)) -> TmEnd(fi2, n)
    | TmNew (fi, name, sub) when notIn name sub -> sub
    | TmNew (fi, name, sub) -> let sub' = eval1 ctx sub in TmNew (fi, name, sub')
    | TmPar(fi1, TmSend(fi2, c1, payload, sub1), TmRecv(fi3, c2, bound, sub2)) when (c1=c2) ->
        TmPar(fi1, sub1, (termSubst ctx payload bound sub2))
    | TmPar(fi1, TmRecv(fi2, c1, bound, sub1), TmSend(fi3, c2, payload, sub2)) when (c1=c2) ->
        TmPar(fi1, (termSubst ctx payload bound sub1), sub2)
    | TmPar(fi1, TmSend(fi2, c1, payload, sub1), TmRepl(fi3, c2, bound, sub2)) when c1=c2 -> 
        TmPar (fi1, TmPar (fi1, sub1, (termSubst ctx payload bound sub2)), TmRepl(fi3, c2, bound, sub2))
    | TmPar(fi1, TmRepl(fi2, c2, bound, sub1), TmSend(fi3, c1, payload, sub2)) when c1=c2 -> 
        TmPar (fi1, TmRepl(fi2, c2, bound, sub1), TmPar (fi3, (termSubst ctx payload bound sub1), sub2))
    | TmPar(fi, sub1, TmEnd(fi1, n)) -> sub1
    | TmPar(fi, TmEnd(fi1, n), sub2) -> sub2
    | TmPar(fi, sub1, sub2) -> (try let sub1' = eval1 ctx sub1 in TmPar(fi, sub1', sub2) 
        with NoRuleApplies -> let sub2'= eval1 ctx sub2 in TmPar(fi, sub1, sub2'))
    (*| TmPar(fi, sub1, TmNew(fi2, name, sub2)) when (notIn name sub1) -> TmNew (fi2, name, TmPar(fi, sub1,sub2))*)
    | _ -> raise NoRuleApplies

let rec addAllNames ctx lt = match lt with 
    TmVar (fi, name) -> addname ctx name
    | TmAbs (fi, name, sub) -> let ctx' = addname ctx name in addAllNames ctx' sub
    | TmApp (fi, sub1, sub2) -> let ctx' = addAllNames ctx sub1 in addAllNames ctx' sub2

let rec transMap ctx lt arg = match lt with
    TmVar (fi, name) -> TmSend(fi, name, arg, TmEnd(fi, 0))
    | TmAbs (fi, name, sub) -> let (ctx, fresh) = pickfreshname (addAllNames ctx sub) arg in 
        TmRecv (fi, arg, name, TmRecv(fi, arg, fresh, transMap ctx sub fresh))
    | TmApp (fi, sub1, sub2) -> 
        let (ctx', freshv) = pickfreshname (addAllNames (addAllNames ctx sub2) sub1) "v" in 
        let (ctx'', freshx) = pickfreshname ctx' "x" in 
        let (ctx''', freshw) = pickfreshname ctx'' "w" in 
        let lhs = transMap ctx''' sub1 freshv in
        let rhs =   
            TmSend(fi, freshv, freshx, 
            TmSend(fi, freshv, arg, 
            TmRepl(fi, freshx, freshw, 
            transMap ctx''' sub2 freshw))) in 
        TmNew (fi, freshv, TmNew(fi, freshx, TmPar(fi, lhs, rhs)))

let translate ctx lt = 
    let (ctx', init) = pickfreshname (addAllNames ctx lt) "u" in transMap ctx' lt init


let rec eval ctx t = match t with
    PTerm (pt) -> 
        pr "\nTook one step:\n";
        printtm ctx t; 
        (try let t' = eval1 ctx pt
            in eval ctx (PTerm (t'))
        with NoRuleApplies -> PTerm (pt))
    | LTerm (lt) ->
        pr "\nTranslating from lambda to pi calc\n";
        let pt = translate ctx lt in 
        Printf.printf "Lambda term: %s\n pi term: %s" (printtm_Lambda ctx lt) (printtm_Pi ctx pt);
        eval ctx (PTerm (pt))
