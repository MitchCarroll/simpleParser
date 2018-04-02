(** A simple test program in OCaml  *)
(** I am using it to learn the Oasis build system *)

(** modules *)
open Syntax;;

(** The main function *)
let () =
  let lexbuf = Lexing.from_channel stdin in
  while true do
    print_endline (string_of_int (Parser.prog Lexer.token lexbuf))
  done
