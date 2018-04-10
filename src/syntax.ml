open Utilities;;

(* add, subtract, multiply, divide, exponentiate *)
type operation = A | S | M | D | E | O | F ;;

type expression =
  | Expression of expression * operation * expression
  | Constant of float
;;

let rec eval = function
  | Constant c -> c
  | Expression (a, op, b) -> 
    (match op with
     | A -> (eval a) +. (eval b)
     | S -> (eval a) -. (eval b)
     | M -> (eval a) *. (eval b)
     | D -> (eval a) /. (eval b)
     | E -> (eval a) ** (eval b)
     | O -> float_of_int ((int_of_float (eval a)) mod (int_of_float (eval b)))
     | F -> fac (eval a))
;;

let exp a m b = Expression (a, m, b);;
let con a = Constant a;;
