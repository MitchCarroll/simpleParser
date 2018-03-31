(** A simple test program in OCaml  *)
(** I am using it to learn the Oasis build system *)


open Funcs;;

(** The main function *)
let () =
        begin
                print_int (term 537);
                print_newline ();

                print_int (term2 537);
                print_newline ();

                print_int (fac 10);
                print_newline ();
                
                print_int (fac_t 10);
                print_newline ();

                print_int (fac2 10);
                print_newline ()
        end
