(** A simple test program in OCaml  *)
(** I am using it to learn the Oasis build system *)

(** modules *)
open Syntax;;

(** The main function *)
let () =
  try
    let lexbuf = Lexing.from_channel stdin in
    while true do
        let answer = (eval (Parser.prog Lexer.token lexbuf))
        in print_endline (" = " ^ (string_of_int answer))
    done
  with End_of_file -> exit 0
