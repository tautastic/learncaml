open Alcotest

let test_longest_common_prefix () =
  check string "[\"flower\"; \"flow\"; \"flight\"] -> \"fl\"" "fl" (Solution.longest_common_prefix ["flower"; "flow"; "flight"]);
  check string "[\"dog\"; \"racecar\"; \"car\"] -> \"\"" "" (Solution.longest_common_prefix ["dog"; "racecar"; "car"]);
  ()

let () =
  run "Longest Common Prefix"
    [ ("All Tests", [ test_case "All Tests" `Quick test_longest_common_prefix ]) ]

