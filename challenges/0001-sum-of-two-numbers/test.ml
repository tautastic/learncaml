open Alcotest

let test_addition () =
  assert (Solution.addition 0 0 = 0);
  assert (Solution.addition 2 3 = 5);
  assert (Solution.addition (-3) (-6) = (-9));
  assert (Solution.addition 7 3 = 10);
  assert (Solution.addition 88 2 = 90);
  ()

let () =
  run "Sum of Two Numbers"
    [ ("All Tests", [ test_case "All Tests" `Quick test_addition ]) ]

