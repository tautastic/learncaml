open Alcotest

let test_tower_hanoi () =
  check int "3 -> 7" 7 (Solution.tower_hanoi 3);
  check int "5 -> 31" 31 (Solution.tower_hanoi 5);
  check int "8 -> 255" 255 (Solution.tower_hanoi 8);
  check int "19 -> 524287" 524287 (Solution.tower_hanoi 19);
  check int "9 -> 511" 511 (Solution.tower_hanoi 9);
  check int "13 -> 8191" 8191 (Solution.tower_hanoi 13);
  check int "0 -> 0" 0 (Solution.tower_hanoi 0);
  ()

let () =
  run "Tower of Hanoi"
    [ ("All Tests", [ test_case "All Tests" `Quick test_tower_hanoi ]) ]

