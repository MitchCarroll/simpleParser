{ open Parser }
let digit = ['0' - '9']
rule token = parse
  | digit+ as int { INT (int_of_string int) }
  | [’ ’ ’\t’] { token lexbuf }
  | '\n' { NEWLINE }
  | "+" { PLUS }
  | "-" { MINUS }
  | "*" { TIMES }
  | "/" { DIVIDE }
  | "^" { POWER }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | _ { token lexbuf }
  | eof { raise End_of_file }
