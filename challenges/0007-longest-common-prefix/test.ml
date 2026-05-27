open Alcotest

let test_longest_common_prefix () =
  assert (Solution.longest_common_prefix ["flower"; "flow"; "flight"] = "fl");
  assert (Solution.longest_common_prefix ["dog"; "racecar"; "car"] = "");
  ()

let () =
  run "Longest Common Prefix"
    [ ("All Tests", [ test_case "All Tests" `Quick test_longest_common_prefix ]) ]

