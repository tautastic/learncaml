(*
   Challenge: Alpha Range

   Implement the function alpha_range with type:
   char -> char -> int -> (char list, string) result

   Behavior:
   - Determine the lower and upper character (based on ASCII order).
   - If step > 0, produce an ascending list from lower to upper using step = abs(step).
   - If step < 0, produce a descending list from upper to lower using step = abs(step).
   - The list includes the starting point (lower for step>0, upper for step<0) and then
     every step-th character until the opposite bound is reached or passed.
     The opposite bound is included only if it lies exactly on a step increment.
   - The order of start and stop does not affect the bounds; only the sign of step
     determines the direction.

   Error cases (return Error msg):
   1. step = 0 or |step| >= 26 -> "step must be a non-zero value between -26 and 26, exclusive"
   2. start and stop have different case (one uppercase, one lowercase) ->
      "both start and stop must share the same case"
*)
let alpha_range (start : char) (stop : char) (step : int) :
    (char list, string) result =
  failwith "not implemented"
