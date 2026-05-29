open Alcotest

let test_convert () =
  check int "6 -> 360" 360 (Solution.convert 6);
  check int "4 -> 240" 240 (Solution.convert 4);
  check int "8 -> 480" 480 (Solution.convert 8);
  check int "60 -> 3600" 3600 (Solution.convert 60);
  ()

let () =
  run "Minutes into Seconds"
    [ ("All Tests", [ test_case "All Tests" `Quick test_convert ]) ]

