open Alcotest

let test_countTrue () =
  assert (Solution.countTrue [true;false;false;true;false] = 2);
  assert (Solution.countTrue [false;false;false;false] = 0);
  assert (Solution.countTrue [] = 0);
  assert (Solution.countTrue [false;false;true;true;false;false;false;true;true;true;true;false;true;true;false] = 8);
  assert (Solution.countTrue [true;false;true;true;false;false;false;false;false] = 3);
  assert (Solution.countTrue [false;true;true;false;true;true;false;true;false;true;false;true;false;true;false] = 8);
  assert (Solution.countTrue [true;false;true;true;true;false;true;true;false;false] = 6);
  assert (Solution.countTrue [false;false;false;false;true;false;true;false;true;false;false] = 3);
  assert (Solution.countTrue [true;false;false;false;true;false;false;true;false;false;false] = 3);
  assert (Solution.countTrue [true;true;false;true;false;false;false;false;true;false] = 4);
  assert (Solution.countTrue [true;false;true;true;false;true;true;true;true;false;true;false;true;false] = 9);
  assert (Solution.countTrue [true;false;true;true;true;true;false;true;true;false;true;false;false;false;false] = 8);
  assert (Solution.countTrue [true;true;false;false;false;false;true;false;true;true;false;true] = 6);
  ()

let () =
  run "How Much is True?"
    [ ("All Tests", [ test_case "All Tests" `Quick test_countTrue ]) ]

