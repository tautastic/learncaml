open Alcotest

let test_remainder () =
  assert (Solution.remainder 7 2 = 1);
  assert (Solution.remainder 3 4 = 3);
  assert (Solution.remainder (-9) 45 = (-9));
  assert (Solution.remainder 5 5 = 0);
  ()

let () =
  run "Remainder of Two Numbers"
    [ ("All Tests", [ test_case "All Tests" `Quick test_remainder ]) ]

