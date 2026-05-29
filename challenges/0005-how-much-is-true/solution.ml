(*
   Challenge: How Much is True
   Create a function which returns the number of true values there are in an array.
*)
let count_true (lst : bool list) : int =
    let int_of_bool b = if b then 1 else 0 in
    List.fold_left (fun acc x -> acc + int_of_bool x) 0 lst
