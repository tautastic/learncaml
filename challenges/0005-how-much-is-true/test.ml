open Alcotest

let test_count_true () =
  check int "[true;false;false;true;false] -> 2" 2
    (Solution.count_true [ true; false; false; true; false ]);
  check int "[false;false;false;false] -> 0" 0
    (Solution.count_true [ false; false; false; false ]);
  check int "[] -> 0" 0 (Solution.count_true []);
  check int
    "[false;false;true;true;false;false;false;true;true;true;true;false;true;true;false] \
     -> 8"
    8
    (Solution.count_true
       [
         false;
         false;
         true;
         true;
         false;
         false;
         false;
         true;
         true;
         true;
         true;
         false;
         true;
         true;
         false;
       ]);
  check int "[true;false;true;true;false;false;false;false;false] -> 3" 3
    (Solution.count_true
       [ true; false; true; true; false; false; false; false; false ]);
  check int
    "[false;true;true;false;true;true;false;true;false;true;false;true;false;true;false] \
     -> 8"
    8
    (Solution.count_true
       [
         false;
         true;
         true;
         false;
         true;
         true;
         false;
         true;
         false;
         true;
         false;
         true;
         false;
         true;
         false;
       ]);
  check int "[true;false;true;true;true;false;true;true;false;false] -> 6" 6
    (Solution.count_true
       [ true; false; true; true; true; false; true; true; false; false ]);
  check int
    "[false;false;false;false;true;false;true;false;true;false;false] -> 3" 3
    (Solution.count_true
       [
         false;
         false;
         false;
         false;
         true;
         false;
         true;
         false;
         true;
         false;
         false;
       ]);
  check int
    "[true;false;false;false;true;false;false;true;false;false;false] -> 3" 3
    (Solution.count_true
       [
         true;
         false;
         false;
         false;
         true;
         false;
         false;
         true;
         false;
         false;
         false;
       ]);
  check int "[true;true;false;true;false;false;false;false;true;false] -> 4" 4
    (Solution.count_true
       [ true; true; false; true; false; false; false; false; true; false ]);
  check int
    "[true;false;true;true;false;true;true;true;true;false;true;false;true;false] \
     -> 9"
    9
    (Solution.count_true
       [
         true;
         false;
         true;
         true;
         false;
         true;
         true;
         true;
         true;
         false;
         true;
         false;
         true;
         false;
       ]);
  check int
    "[true;false;true;true;true;true;false;true;true;false;true;false;false;false;false] \
     -> 8"
    8
    (Solution.count_true
       [
         true;
         false;
         true;
         true;
         true;
         true;
         false;
         true;
         true;
         false;
         true;
         false;
         false;
         false;
         false;
       ]);
  check int
    "[true;true;false;false;false;false;true;false;true;true;false;true] -> 6" 6
    (Solution.count_true
       [
         true;
         true;
         false;
         false;
         false;
         false;
         true;
         false;
         true;
         true;
         false;
         true;
       ]);
  ()

let () =
  run "How Much is True"
    [ ("All Tests", [ test_case "All Tests" `Quick test_count_true ]) ]
