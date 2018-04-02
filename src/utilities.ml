let fac = function
  | 0
  | 1 -> 1
  | n when n > 1 ->
    let rec fac_aux acc = function
      | 0
      | 1 -> acc
      | k -> fac_aux (k - 1) (k * acc)
    in fac_aux 1 n
  | _ -> 0
;;
