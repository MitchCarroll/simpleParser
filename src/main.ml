(** A simple test program in OCaml  *)
(** I am using it to learn the Oasis build system *)

(** a recursive termial function *)
let rec term = function
        | n when n < 0 -> 0
        | n -> n + (term (n - 1))
;;

(** a termial function that does not use loops or recursion *)
let term2 k =
        let n = float_of_int k
        in int_of_float ((n *. n +. n) /. 2.)
;;

(** a recursive factorial function *)
let rec fac = function
        | 0
        | 1 -> 1
        | n when n > 1 -> (n * (fac (n - 1)))
        | _ -> 0
;;

(** a tail-recursive factorial function *)
let fac_t = function
        | 0
        | 1 -> 1
        | n -> let rec fac_aux k acc =
                 (match k with
                  | 0
                  | 1 -> acc
                  | _ -> fac_aux (k - 1) (acc * k))
                in fac_aux n 1
        | _ -> 0
;;

(** hopefully, a factorial function that does not use loops
 * or recursion *)
let fac2 = function
        | k -> let n = float_of_int k 
                in int_of_float 
                ((log ((n ** n *. n))) /.
                (log n))
;;

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
