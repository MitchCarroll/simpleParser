(** A simple test program in OCaml  *)
(** I am using it to learn the Oasis build system *)

(** modules *)
open Syntax;;

(** the expression
 *
 * (1 + ((2 - (3 * 4)) / 5))^6
 * 
 **)

let e =
  (*  Expression
      (Expression
         (Constant 1, A, Expression
            (Expression
               (Constant 2, S, Expression
                  (Constant 3, M, Constant 4)), 
             D, Constant 5)), 
       E, Constant 6)
  *)

  exp (exp (con 1) A (exp 
                        (exp (con 2) S (exp 
                                          (con 3) M (con 4))) 
                        D (con 5))) 
    E (con 6) ;;

(** The main function *)
let () =
  (*  print_endline (string_of_int (eval e));; *)
  let lexbuf = Lexing.from_channel stdin in
  while true do
    Parser.prog Lexer.token lexbuf
  done
with End_of_file -> exit 0
