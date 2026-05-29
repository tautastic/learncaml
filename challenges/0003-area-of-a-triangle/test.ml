open Alcotest

let test_tri_area () =
  check int "3 2 -> 3" 3 (Solution.tri_area 3 2);
  check int "5 4 -> 10" 10 (Solution.tri_area 5 4);
  check int "10 10 -> 50" 50 (Solution.tri_area 10 10);
  check int "0 60 -> 0" 0 (Solution.tri_area 0 60);
  check int "12 11 -> 66" 66 (Solution.tri_area 12 11);
  ()

let () =
  run "Area of a Triangle"
    [ ("All Tests", [ test_case "All Tests" `Quick test_tri_area ]) ]

