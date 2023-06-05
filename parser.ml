type token =
  | IMPORT of (Support.Error.info)
  | LAMBDA of (Support.Error.info)
  | NEW of (Support.Error.info)
  | SEND of (Support.Error.info)
  | RECV of (Support.Error.info)
  | END of (Support.Error.info)
  | ON of (Support.Error.info)
  | UCID of (string Support.Error.withinfo)
  | LCID of (string Support.Error.withinfo)
  | INTV of (int Support.Error.withinfo)
  | FLOATV of (float Support.Error.withinfo)
  | STRINGV of (string Support.Error.withinfo)
  | APOSTROPHE of (Support.Error.info)
  | DQUOTE of (Support.Error.info)
  | ARROW of (Support.Error.info)
  | BANG of (Support.Error.info)
  | BARGT of (Support.Error.info)
  | BARRCURLY of (Support.Error.info)
  | BARRSQUARE of (Support.Error.info)
  | COLON of (Support.Error.info)
  | COLONCOLON of (Support.Error.info)
  | COLONEQ of (Support.Error.info)
  | COLONHASH of (Support.Error.info)
  | COMMA of (Support.Error.info)
  | DARROW of (Support.Error.info)
  | DDARROW of (Support.Error.info)
  | DOT of (Support.Error.info)
  | EOF of (Support.Error.info)
  | EQ of (Support.Error.info)
  | EQEQ of (Support.Error.info)
  | EXISTS of (Support.Error.info)
  | GT of (Support.Error.info)
  | HASH of (Support.Error.info)
  | LCURLY of (Support.Error.info)
  | LCURLYBAR of (Support.Error.info)
  | LEFTARROW of (Support.Error.info)
  | LPAREN of (Support.Error.info)
  | LSQUARE of (Support.Error.info)
  | LSQUAREBAR of (Support.Error.info)
  | LT of (Support.Error.info)
  | RCURLY of (Support.Error.info)
  | RPAREN of (Support.Error.info)
  | RSQUARE of (Support.Error.info)
  | SEMI of (Support.Error.info)
  | SLASH of (Support.Error.info)
  | STAR of (Support.Error.info)
  | TRIANGLE of (Support.Error.info)
  | USCORE of (Support.Error.info)
  | VBAR of (Support.Error.info)

open Parsing;;
let _ = parse_error;;
# 7 "parser.mly"
open Support.Error
open Support.Pervasive
open Syntax
# 59 "parser.ml"
let yytransl_const = [|
    0|]

let yytransl_block = [|
  257 (* IMPORT *);
  258 (* LAMBDA *);
  259 (* NEW *);
  260 (* SEND *);
  261 (* RECV *);
  262 (* END *);
  263 (* ON *);
  264 (* UCID *);
  265 (* LCID *);
  266 (* INTV *);
  267 (* FLOATV *);
  268 (* STRINGV *);
  269 (* APOSTROPHE *);
  270 (* DQUOTE *);
  271 (* ARROW *);
  272 (* BANG *);
  273 (* BARGT *);
  274 (* BARRCURLY *);
  275 (* BARRSQUARE *);
  276 (* COLON *);
  277 (* COLONCOLON *);
  278 (* COLONEQ *);
  279 (* COLONHASH *);
  280 (* COMMA *);
  281 (* DARROW *);
  282 (* DDARROW *);
  283 (* DOT *);
    0 (* EOF *);
  284 (* EQ *);
  285 (* EQEQ *);
  286 (* EXISTS *);
  287 (* GT *);
  288 (* HASH *);
  289 (* LCURLY *);
  290 (* LCURLYBAR *);
  291 (* LEFTARROW *);
  292 (* LPAREN *);
  293 (* LSQUARE *);
  294 (* LSQUAREBAR *);
  295 (* LT *);
  296 (* RCURLY *);
  297 (* RPAREN *);
  298 (* RSQUARE *);
  299 (* SEMI *);
  300 (* SLASH *);
  301 (* STAR *);
  302 (* TRIANGLE *);
  303 (* USCORE *);
  304 (* VBAR *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\004\000\003\000\003\000\
\005\000\005\000\005\000\005\000\005\000\005\000\006\000\006\000\
\006\000\007\000\007\000\008\000\008\000\000\000"

let yylen = "\002\000\
\001\000\003\000\002\000\001\000\002\000\001\000\001\000\001\000\
\001\000\005\000\008\000\008\000\006\000\009\000\001\000\004\000\
\004\000\001\000\002\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\009\000\000\000\000\000\001\000\
\000\000\022\000\000\000\004\000\007\000\008\000\000\000\018\000\
\003\000\000\000\000\000\006\000\005\000\000\000\000\000\000\000\
\021\000\000\000\000\000\000\000\000\000\019\000\000\000\000\000\
\000\000\000\000\000\000\000\000\020\000\002\000\016\000\017\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\010\000\000\000\013\000\000\000\000\000\000\000\
\000\000\000\000\000\000\011\000\012\000\014\000"

let yydgoto = "\002\000\
\010\000\011\000\012\000\021\000\013\000\014\000\015\000\016\000"

let yysindex = "\012\000\
\001\000\000\000\008\255\249\254\000\000\231\254\243\254\000\000\
\001\255\000\000\241\254\000\000\000\000\000\000\253\254\000\000\
\000\000\003\255\005\255\000\000\000\000\022\255\025\255\032\255\
\000\000\250\254\011\255\001\000\007\255\000\000\007\255\007\255\
\044\255\013\255\021\255\255\254\000\000\000\000\000\000\000\000\
\050\255\029\255\048\255\049\255\015\255\018\255\051\255\255\254\
\020\255\023\255\000\000\024\255\000\000\035\255\036\255\039\255\
\255\254\255\254\255\254\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\002\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\227\254\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\039\000\000\000\000\000\000\000\247\255\015\000\000\000\053\000"

let yytablesize = 293
let yytable = "\026\000\
\008\000\018\000\004\000\023\000\005\000\025\000\005\000\024\000\
\004\000\025\000\021\000\015\000\001\000\015\000\007\000\025\000\
\007\000\023\000\020\000\017\000\005\000\024\000\022\000\027\000\
\043\000\044\000\046\000\028\000\033\000\031\000\007\000\032\000\
\029\000\034\000\045\000\026\000\009\000\021\000\053\000\019\000\
\035\000\036\000\029\000\027\000\021\000\039\000\040\000\060\000\
\061\000\062\000\045\000\037\000\041\000\042\000\047\000\048\000\
\049\000\050\000\051\000\052\000\054\000\057\000\058\000\055\000\
\056\000\059\000\038\000\030\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\003\000\004\000\000\000\000\000\000\000\005\000\000\000\
\000\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\
\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\009\000"

let yycheck = "\009\000\
\000\000\009\001\002\001\003\001\006\001\009\001\006\001\007\001\
\002\001\009\001\009\001\041\001\001\000\043\001\016\001\009\001\
\016\001\003\001\044\001\012\001\006\001\007\001\036\001\009\000\
\004\001\005\001\036\000\043\001\007\001\027\001\016\001\027\001\
\036\001\009\001\036\001\045\000\036\001\036\001\048\000\047\001\
\009\001\048\001\036\001\029\000\043\001\031\000\032\000\057\000\
\058\000\059\000\036\001\041\001\009\001\041\001\005\001\027\001\
\009\001\009\001\041\001\009\001\041\001\027\001\027\001\041\001\
\041\001\027\001\028\000\015\000\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\002\001\255\255\255\255\255\255\006\001\255\255\
\255\255\009\001\255\255\255\255\255\255\255\255\255\255\255\255\
\016\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\036\001"

let yynames_const = "\
  "

let yynames_block = "\
  IMPORT\000\
  LAMBDA\000\
  NEW\000\
  SEND\000\
  RECV\000\
  END\000\
  ON\000\
  UCID\000\
  LCID\000\
  INTV\000\
  FLOATV\000\
  STRINGV\000\
  APOSTROPHE\000\
  DQUOTE\000\
  ARROW\000\
  BANG\000\
  BARGT\000\
  BARRCURLY\000\
  BARRSQUARE\000\
  COLON\000\
  COLONCOLON\000\
  COLONEQ\000\
  COLONHASH\000\
  COMMA\000\
  DARROW\000\
  DDARROW\000\
  DOT\000\
  EOF\000\
  EQ\000\
  EQEQ\000\
  EXISTS\000\
  GT\000\
  HASH\000\
  LCURLY\000\
  LCURLYBAR\000\
  LEFTARROW\000\
  LPAREN\000\
  LSQUARE\000\
  LSQUAREBAR\000\
  LT\000\
  RCURLY\000\
  RPAREN\000\
  RSQUARE\000\
  SEMI\000\
  SLASH\000\
  STAR\000\
  TRIANGLE\000\
  USCORE\000\
  VBAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Support.Error.info) in
    Obj.repr(
# 107 "parser.mly"
      ( fun ctx -> [],ctx )
# 302 "parser.ml"
               :  Syntax.context -> (Syntax.command list * Syntax.context) ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'Command) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 :  Syntax.context -> (Syntax.command list * Syntax.context) ) in
    Obj.repr(
# 109 "parser.mly"
      ( fun ctx ->
          let cmd,ctx = _1 ctx in
          let cmds,ctx = _3 ctx in
          cmd::cmds,ctx )
# 314 "parser.ml"
               :  Syntax.context -> (Syntax.command list * Syntax.context) ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string Support.Error.withinfo) in
    Obj.repr(
# 116 "parser.mly"
                   ( fun ctx -> (Import(_2.v)),ctx )
# 322 "parser.ml"
               : 'Command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'Term) in
    Obj.repr(
# 118 "parser.mly"
      ( fun ctx -> (let t = _1 ctx in Eval(tmInfo t,t)),ctx )
# 329 "parser.ml"
               : 'Command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string Support.Error.withinfo) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'Binder) in
    Obj.repr(
# 120 "parser.mly"
      ( fun ctx -> ((Bind(_1.i,_1.v,_2 ctx)), addname ctx _1.v) )
# 337 "parser.ml"
               : 'Command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Support.Error.info) in
    Obj.repr(
# 125 "parser.mly"
      ( fun ctx -> NameBind )
# 344 "parser.ml"
               : 'Binder))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'PiTerm) in
    Obj.repr(
# 127 "parser.mly"
             (fun ctx -> PTerm (_1 ctx))
# 351 "parser.ml"
               : 'Term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'LambdaTerm) in
    Obj.repr(
# 128 "parser.mly"
                 (fun ctx -> LTerm(_1 ctx))
# 358 "parser.ml"
               : 'Term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Support.Error.info) in
    Obj.repr(
# 131 "parser.mly"
          (fun ctx -> TmEnd(_1, 0))
# 365 "parser.ml"
               : 'PiTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'PiTerm) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Support.Error.info) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'PiTerm) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : Support.Error.info) in
    Obj.repr(
# 132 "parser.mly"
                                      (
        fun ctx -> TmPar(_1, _2 ctx, _4 ctx)
    )
# 378 "parser.ml"
               : 'PiTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 6 : Support.Error.info) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string Support.Error.withinfo) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : Support.Error.info) in
    let _5 = (Parsing.peek_val __caml_parser_env 3 : string Support.Error.withinfo) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : Support.Error.info) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'PiTerm) in
    Obj.repr(
# 135 "parser.mly"
                                                 (
        fun ctx -> TmSend(_1, _3.v, _5.v, _8 ctx)
    )
# 394 "parser.ml"
               : 'PiTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 6 : Support.Error.info) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string Support.Error.withinfo) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : Support.Error.info) in
    let _5 = (Parsing.peek_val __caml_parser_env 3 : string Support.Error.withinfo) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : Support.Error.info) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'PiTerm) in
    Obj.repr(
# 138 "parser.mly"
                                                 (
        fun ctx -> TmRecv(_1, _3.v, _5.v, _8 ctx)
    )
# 410 "parser.ml"
               : 'PiTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : Support.Error.info) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string Support.Error.withinfo) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Support.Error.info) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'PiTerm) in
    Obj.repr(
# 141 "parser.mly"
                                        (
        fun ctx -> TmNew(_1, _3.v, _6 ctx)
    )
# 424 "parser.ml"
               : 'PiTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : Support.Error.info) in
    let _3 = (Parsing.peek_val __caml_parser_env 6 : Support.Error.info) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : string Support.Error.withinfo) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : Support.Error.info) in
    let _6 = (Parsing.peek_val __caml_parser_env 3 : string Support.Error.withinfo) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : Support.Error.info) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'PiTerm) in
    Obj.repr(
# 144 "parser.mly"
                                                      (
        fun ctx -> TmRepl (_1, _4.v, _6.v,  _9 ctx)
    )
# 441 "parser.ml"
               : 'PiTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'AppTerm) in
    Obj.repr(
# 149 "parser.mly"
      ( _1 )
# 448 "parser.ml"
               : 'LambdaTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string Support.Error.withinfo) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'LambdaTerm) in
    Obj.repr(
# 151 "parser.mly"
      ( fun ctx ->
          let ctx1 = addname ctx _2.v in
          TmAbs(_1, _2.v, _4 ctx1) )
# 460 "parser.ml"
               : 'LambdaTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Support.Error.info) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Support.Error.info) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'LambdaTerm) in
    Obj.repr(
# 155 "parser.mly"
      ( fun ctx ->
          let ctx1 = addname ctx "_" in
          TmAbs(_1, "_", _4 ctx1) )
# 472 "parser.ml"
               : 'LambdaTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ATerm) in
    Obj.repr(
# 161 "parser.mly"
      ( _1 )
# 479 "parser.ml"
               : 'AppTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'AppTerm) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'ATerm) in
    Obj.repr(
# 163 "parser.mly"
      ( fun ctx ->
          let e1 = _1 ctx in
          let e2 = _2 ctx in
          TmApp(tmInfo (LTerm e1),e1,e2) )
# 490 "parser.ml"
               : 'AppTerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Support.Error.info) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'LambdaTerm) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Support.Error.info) in
    Obj.repr(
# 171 "parser.mly"
      ( _2 )
# 499 "parser.ml"
               : 'ATerm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string Support.Error.withinfo) in
    Obj.repr(
# 173 "parser.mly"
      ( fun ctx ->
          TmVar(_1.i, _1.v) )
# 507 "parser.ml"
               : 'ATerm))
(* Entry toplevel *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let toplevel (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf :  Syntax.context -> (Syntax.command list * Syntax.context) )
