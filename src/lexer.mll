{ open Parser }
let digit = ['0' - '9']
rule token = parse
  | digit+ as num { NUM (int_of_string num) }
  | '\n' 
  | '\r' { NEWLINE }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { TIMES }
  | '/' { DIVIDE }
  | '^' { POWER }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | eof { raise End_of_file }
  | ' '
  | '\t'
  | _ { token lexbuf }
