open Alcotest

let test_addition () =
  check int "2 3 -> 5" 5 (Solution.addition 2 3);
  check int "(-3) (-6) -> (-9)" (-9) (Solution.addition (-3) (-6));
  check int "7 3 -> 10" 10 (Solution.addition 7 3);
  check int "88 2 -> 90" 90 (Solution.addition 88 2);
  ()

let () =
  run "Sum of Two Numbers"
    [ ("All Tests", [ test_case "All Tests" `Quick test_addition ]) ]
