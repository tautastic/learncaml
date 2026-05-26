open Alcotest

let test_triArea () =
  assert (Solution.triArea 3 2 = 3);
  assert (Solution.triArea 5 4 = 10);
  assert (Solution.triArea 10 10 = 50);
  assert (Solution.triArea 0 60 = 0);
  assert (Solution.triArea 12 11 = 66);
  ()

let () =
  run "Area of Triangle"
    [ ("All Tests", [ test_case "All Tests" `Quick test_triArea ]) ]

