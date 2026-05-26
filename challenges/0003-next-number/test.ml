open Alcotest

let test_next_num () =
  assert (Solution.next_num 2 = 3);
  assert (Solution.next_num (-9) = (-8));
  assert (Solution.next_num 0 = 1);
  assert (Solution.next_num 999 = 1000);
  assert (Solution.next_num 73 = 74);
  ()

let () =
  run "Next Number"
    [ ("All Tests", [ test_case "All Tests" `Quick test_next_num ]) ]

