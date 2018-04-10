{ 
open Parser;;
open Utilities;;
}
let digit = ['0' - '9']
rule token = parse
  | digit+
  | "." digit+ 
  | digit+ "." digit* 
  | "-" digit+ 
  | "-." digit+ 
  | "-" digit+ "." digit* as num { NUM (float_of_string num) }
(*   | digit+ "!" as num { NUM (float_of_int (fac (int_of_string num))) } *)
(*   | digit+ "!" { NUM (float_of_int (int_of_string )) } *)
  | '\n' 
  | '\r' { NEWLINE }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { TIMES }
  | '/' { DIVIDE }
  | '^' { POWER }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '!' { FAC }
  | '%' { MOD }
  | eof { raise End_of_file }
  | ' '
  | '\t'
  | _ { token lexbuf }
