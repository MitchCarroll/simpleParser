{ open Parser }
let digit = ['0' - '9']
rule token = parse
  | digit+ as num { INT (int_of_string num) }
  | '\n' { NEWLINE }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { TIMES }
  | '/' { DIVIDE }
  | '^' { POWER }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | _ { token lexbuf }
