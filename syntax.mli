(* module Syntax: syntax trees and associated support functions *)

open Support.Pervasive
open Support.Error

(* Data type definitions *)
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

type command =
    Import of string
  | Eval of info * term
  | Bind of info * string * binding

(* Contexts *)
type context
val emptycontext : context 
val ctxlength : context -> int
val setlinear : context -> bool -> context
val islinear : context -> bool
val addbinding : context -> string -> binding -> context
val addname: context -> string -> context
val index2name : info -> context -> int -> string
val getbinding : info -> context -> int -> binding
val name2index : info -> context -> string -> int
val isnamebound : context -> string -> bool
val pickfreshname : context -> string -> context * string


(* Shifting and substitution *)
val termSubst: context -> string -> string -> piTerm -> piTerm

(* Printing *)
val printtm: context -> term -> unit
val printtm_Lambda: context -> lambdaTerm -> string
val printtm_Pi: context -> piTerm -> string
val prbinding : context -> binding -> unit

(* Misc *)
val tmInfo: term -> info

