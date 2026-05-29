open Alcotest

let test_remainder () =
  check int "7 2 -> 1" 1 (Solution.remainder 7 2);
  check int "3 4 -> 3" 3 (Solution.remainder 3 4);
  check int "(-9) (-45) -> (-9)" (-9) (Solution.remainder (-9) (-45));
  check int "5 5 -> 0" 0 (Solution.remainder 5 5);
  ()

let () =
  run "Remainder of Two Numbers"
    [ ("All Tests", [ test_case "All Tests" `Quick test_remainder ]) ]
