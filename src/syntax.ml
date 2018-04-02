open Utilities;;

(* add, subtract, multiply, divide, exponentiate *)
type operation = A | S | M | D | E ;;

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
     | E -> (eval a) ** (eval b))
;;

let exp a m b = Expression (a, m, b);;
let con a = Constant a;;
