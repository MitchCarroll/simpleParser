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
  Expression(Expression(Constant 1, A, Expression(Expression(Constant 2, S, Expression(Constant 3, M, Constant 4)), D, Constant 5)), E, Constant 6)

(** The main function *)
let () =
    print_endline (string_of_int (eval e));;
