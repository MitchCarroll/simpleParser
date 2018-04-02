type operation = A | S | M | D | E
type expression =
    Expression of expression * operation * expression
  | Constant of float
val eval : expression -> float
val exp : expression -> operation -> expression -> expression
val con : float -> expression
