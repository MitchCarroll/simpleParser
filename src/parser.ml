type token =
  | NUM of (int)
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | POWER
  | LPAREN
  | RPAREN
  | NEWLINE

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  258 (* PLUS *);
  259 (* MINUS *);
  260 (* TIMES *);
  261 (* DIVIDE *);
  262 (* POWER *);
  263 (* LPAREN *);
  264 (* RPAREN *);
  265 (* NEWLINE *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\003\000\003\000\004\000\004\000\
\004\000\004\000\004\000\000\000"

let yylen = "\002\000\
\000\000\002\000\001\000\002\000\001\000\005\000\001\000\001\000\
\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\005\000\000\000\003\000\002\000\000\000\
\000\000\004\000\007\000\008\000\009\000\010\000\011\000\000\000\
\000\000\006\000"

let yydgoto = "\002\000\
\003\000\007\000\008\000\016\000"

let yysindex = "\002\000\
\000\000\000\000\000\255\000\000\001\255\000\000\000\000\251\254\
\010\255\000\000\000\000\000\000\000\000\000\000\000\000\001\255\
\253\254\000\000"

let yyrindex = "\000\000\
\000\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\251\255\000\000"

let yytablesize = 16
let yytable = "\009\000\
\004\000\004\000\001\000\010\000\018\000\012\000\005\000\005\000\
\006\000\000\000\017\000\011\000\012\000\013\000\014\000\015\000"

let yycheck = "\005\000\
\001\001\001\001\001\000\009\001\008\001\000\000\007\001\007\001\
\009\001\255\255\016\000\002\001\003\001\004\001\005\001\006\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  POWER\000\
  LPAREN\000\
  RPAREN\000\
  NEWLINE\000\
  "

let yynames_block = "\
  NUM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 9 "parser.mly"
    ( )
# 89 "parser.ml"
               : expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : expression) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 10 "parser.mly"
              ( )
# 97 "parser.ml"
               : expression))
; (fun __caml_parser_env ->
    Obj.repr(
# 13 "parser.mly"
            ( )
# 103 "parser.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 14 "parser.mly"
                 ( _1 )
# 110 "parser.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 17 "parser.mly"
        ( _1 )
# 117 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'op) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 18 "parser.mly"
                               ( eval (exp _2 _3 _4) )
# 126 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 21 "parser.mly"
         ( A )
# 132 "parser.ml"
               : 'op))
; (fun __caml_parser_env ->
    Obj.repr(
# 22 "parser.mly"
          ( S )
# 138 "parser.ml"
               : 'op))
; (fun __caml_parser_env ->
    Obj.repr(
# 23 "parser.mly"
          ( M )
# 144 "parser.ml"
               : 'op))
; (fun __caml_parser_env ->
    Obj.repr(
# 24 "parser.mly"
           ( D )
# 150 "parser.ml"
               : 'op))
; (fun __caml_parser_env ->
    Obj.repr(
# 25 "parser.mly"
          ( E )
# 156 "parser.ml"
               : 'op))
(* Entry prog *)
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
let prog (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : expression)
;;
