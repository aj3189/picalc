open Format
open Support.Error
open Support.Pervasive
open Printf

(* ---------------------------------------------------------------------- *)
(* Datatypes *)

type piTerm =
  TmEnd of info * int
  | TmSend of info * string * string * piTerm
  | TmRecv of info * string * string * piTerm
  | TmPar of info * piTerm * piTerm
  | TmNew of info * string * piTerm
  | TmRepl of info * string * string * piTerm

type lambdaTerm =
  TmVar of info * string
  | TmAbs of info * string * lambdaTerm
  | TmApp of info * lambdaTerm * lambdaTerm

type term = PTerm of piTerm | LTerm of lambdaTerm

type binding =
    NameBind 

type context = { 
  bound : (string * binding) list;
  linear: bool
  }

type command =
    Import of string
  | Eval of info * term
  | Bind of info * string * binding

(* ---------------------------------------------------------------------- *)
(* Context management *)

let emptycontext = {bound = []; linear = false }

let ctxlength ctx = List.length ctx.bound

let addbinding ctx x bind = {ctx with bound = (x,bind)::ctx.bound}

let addname ctx x = addbinding ctx x NameBind

let setlinear ctx b = {ctx with linear = b}
let isnamebound ctx x =
  let rec isnameboundhelp b x = 
    match b with
        [] -> false
      | (y,_)::rest ->
          if y=x then true
          else isnameboundhelp rest x in 
    isnameboundhelp ctx.bound x

let rec pickfreshname ctx x =
  if isnamebound ctx x then pickfreshname ctx (x^"'")
  else {ctx with bound = ((x,NameBind)::ctx.bound)}, x

let index2name fi ctx x =
  try
    let (xn,_) = List.nth ctx.bound x in
    xn
  with Failure _ ->
    let msg =
      Printf.sprintf "Variable lookup failure: offset: %d, ctx size: %d" in
    error fi (msg x (List.length ctx.bound))

let rec name2index fi ctx x =
  match ctx.bound with
      [] -> error fi ("Identifier " ^ x ^ " is unbound")
    | (y,_)::rest ->
        if y=x then 0
        else 1 + (name2index fi {ctx with bound = rest} x)

(* ---------------------------------------------------------------------- *)
(* Substitution *)

let rec termSubst ctx j s t =
  let subname name = if name = s then j else name in
  match t with 
  TmEnd (fi, n) -> t
  | TmNew (fi, name, sub) -> 
    if j = name then let ctx, newname = (pickfreshname ctx name) in (termSubst ctx j s (TmNew(fi, newname, (termSubst ctx newname name sub))))
    else if s = name then t 
    else TmNew (fi, name, (termSubst ctx j s sub))
  | TmSend (fi, chan, payload, sub) -> TmSend(fi, (subname chan), (subname payload), termSubst ctx j s sub)
  | TmRecv (fi, chan, bound, sub) -> let newchan = subname chan in 
    if bound = j then let ctx, newname = (pickfreshname ctx bound) in (termSubst ctx j s (TmRecv(fi, newchan, newname, (termSubst ctx newname bound sub))))
    else if bound = s then t
    else TmRecv(fi, newchan, bound, termSubst ctx j s sub)
  | TmPar(fi, sub1, sub2) -> TmPar(fi, termSubst ctx j s sub1, termSubst ctx j s sub2)
  | TmRepl(fi, chan, bound, sub) -> let newchan = subname chan in 
    if bound = j then let ctx, newname = (pickfreshname ctx bound) in (termSubst ctx j s (TmRepl(fi, newchan, newname, (termSubst ctx newname bound sub))))
    else if bound = s then t
    else TmRepl(fi, newchan, bound, termSubst ctx j s sub)

(* ---------------------------------------------------------------------- *)
(* Context management (continued) *)

let rec getbinding fi ctx i =
  try
    let (_,bind) = List.nth ctx.bound i in
    bind 
  with Failure _ ->
    let msg =
      Printf.sprintf "Variable lookup failure: offset: %d, ctx size: %d" in
    error fi (msg i (List.length ctx.bound))
 
(* ---------------------------------------------------------------------- *)
(* Extracting file info *)

let tmInfo t = match t with
  PTerm(pt) -> (match pt with
    TmEnd(fi,_) -> fi
    | TmSend(fi, _,_,_) -> fi
    | TmRecv(fi, _, _, _) -> fi
    | TmPar(fi, _, _) -> fi
    | TmNew(fi, _, _) -> fi
    | TmRepl(fi, _, _, _) -> fi)
  | LTerm (lt) -> (match lt with
    TmVar(fi,_) -> fi
    | TmAbs(fi,_,_) -> fi
    | TmApp(fi, _, _) -> fi )

(* ---------------------------------------------------------------------- *)
(* Printing *)

(* The printing functions call these utility functions to insert grouping
  information and line-breaking hints for the pretty-printing library:
     obox   Open a "box" whose contents will be indented by two spaces if
            the whole box cannot fit on the current line
     obox0  Same but indent continuation lines to the same column as the
            beginning of the box rather than 2 more columns to the right
     cbox   Close the current box
     break  Insert a breakpoint indicating where the line maybe broken if
            necessary.
  See the documentation for the Format module in the OCaml library for
  more details. 
*)

let obox0() = open_hvbox 0
let obox() = open_hvbox 2
let cbox() = close_box()
let break() = print_break 0 0

let small t = 
  match t with
    TmEnd(_) -> true
    | _ -> false

let rec printtm_Pi ctx t = match t with
    TmEnd(fi, n) -> "end"
    | TmNew (fi, name, sub) -> Printf.sprintf "(new %s).%s" name (printtm_Pi ctx sub)
    | TmSend (fi, chan, payload, sub) -> Printf.sprintf "(on %s send %s).%s" chan payload (printtm_Pi ctx sub)
    | TmRecv (fi, chan, payload, sub) -> Printf.sprintf "(on %s recv %s).%s" chan payload (printtm_Pi ctx sub)
    | TmPar (fi, sub1, sub2) -> Printf.sprintf "(%s | %s)" (printtm_Pi ctx sub1) (printtm_Pi ctx sub2)
    | TmRepl (fi, chan, bound, sub) -> Printf.sprintf "!(on %s recv %s).%s" chan bound (printtm_Pi ctx sub)

let rec printtm_Lambda ctx t = match t with 
  TmVar (fi, name) -> name
  | TmAbs (fi, name, sub) -> Printf.sprintf "lambda %s. %s" name (printtm_Lambda ctx sub)
  | TmApp (fi, sub1, sub2) -> Printf.sprintf "(%s) (%s)" (printtm_Lambda ctx sub1) (printtm_Lambda ctx sub2)

let prbinding ctx b = match b with
    NameBind -> () 

let printtm ctx t = let s = (match t with PTerm (pt) -> printtm_Pi ctx pt 
                            | LTerm (lt) -> printtm_Lambda ctx lt) 
                          in pr s


