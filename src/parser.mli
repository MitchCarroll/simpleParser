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

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> expression
