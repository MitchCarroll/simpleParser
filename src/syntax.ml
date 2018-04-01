(* add, subtract, multiply, divide, exponentiate *)
type operation = A | S | M | D | E ;;

type expression =
  | Expression of expression * operation * expression
  | Constant of int
;;

let rec eval = function
  | Constant c -> c
  | Expression (a, op, b) -> 
    match op with
    | A -> (eval a) + (eval b)
    | S -> (eval a) - (eval b)
    | M -> (eval a) * (eval b)
    | D -> (eval a) / (eval b)
    | E -> int_of_float
             ((float_of_int (eval a)) **
              (float_of_int (eval b)))
;;
