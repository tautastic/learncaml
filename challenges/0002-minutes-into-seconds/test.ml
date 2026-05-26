open Alcotest

let test_convert () =
  assert (Solution.convert 6 = 360);
  assert (Solution.convert 4 = 240);
  assert (Solution.convert 8 = 480);
  assert (Solution.convert 60 = 3600);
  ()

let () =
  run "Minutes into Seconds"
    [ ("All Tests", [ test_case "All Tests" `Quick test_convert ]) ]

