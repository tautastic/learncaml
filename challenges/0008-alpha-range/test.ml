open Alcotest

let check_ok (start, stop, step) expected =
  match Solution.alpha_range start stop step with
  | Ok lst -> check (list char) (Printf.sprintf "%c %c %d" start stop step) expected lst
  | Error e -> fail ("Expected Ok but got Error: " ^ e)

let check_error (start, stop, step) expected_msg =
  match Solution.alpha_range start stop step with
  | Ok lst -> fail ("Expected Error but got Ok: " ^ String.concat ";" (List.map (String.make 1) lst))
  | Error e -> check string (Printf.sprintf "%c %c %d" start stop step) expected_msg e

let test_alpha_range () =
  check_ok ('i', 'z', 1) ['i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];
  check_ok ('H', 'I', 1) ['H'; 'I'];
  check_ok ('g', 'o', 1) ['g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'];
  check_ok ('L', 'Y', 1) ['L'; 'M'; 'N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'];
  check_ok ('m', 'd', 1) ['d'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'];
  check_ok ('M', 'S', 1) ['M'; 'N'; 'O'; 'P'; 'Q'; 'R'; 'S'];
  check_ok ('d', 'a', 1) ['a'; 'b'; 'c'; 'd'];
  check_ok ('S', 'D', 1) ['D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'; 'N'; 'O'; 'P'; 'Q'; 'R'; 'S'];
  check_ok ('k', 'd', 1) ['d'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'];
  check_ok ('I', 'X', 1) ['I'; 'J'; 'K'; 'L'; 'M'; 'N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'];
  check_ok ('b', 'g', (-1)) ['g'; 'f'; 'e'; 'd'; 'c'; 'b'];
  check_ok ('D', 'B', (-1)) ['D'; 'C'; 'B'];
  check_ok ('n', 'o', (-1)) ['o'; 'n'];
  check_ok ('S', 'U', (-1)) ['U'; 'T'; 'S'];
  check_ok ('a', 'l', (-1)) ['l'; 'k'; 'j'; 'i'; 'h'; 'g'; 'f'; 'e'; 'd'; 'c'; 'b'; 'a'];
  check_ok ('D', 'P', (-1)) ['P'; 'O'; 'N'; 'M'; 'L'; 'K'; 'J'; 'I'; 'H'; 'G'; 'F'; 'E'; 'D'];
  check_ok ('m', 'k', (-1)) ['m'; 'l'; 'k'];
  check_ok ('Z', 'P', (-1)) ['Z'; 'Y'; 'X'; 'W'; 'V'; 'U'; 'T'; 'S'; 'R'; 'Q'; 'P'];
  check_ok ('j', 'u', (-1)) ['u'; 't'; 's'; 'r'; 'q'; 'p'; 'o'; 'n'; 'm'; 'l'; 'k'; 'j'];
  check_ok ('X', 'A', (-1)) ['X'; 'W'; 'V'; 'U'; 'T'; 'S'; 'R'; 'Q'; 'P'; 'O'; 'N'; 'M'; 'L'; 'K'; 'J'; 'I'; 'H'; 'G'; 'F'; 'E'; 'D'; 'C'; 'B'; 'A'];
  check_ok ('g', 'v', (-1)) ['v'; 'u'; 't'; 's'; 'r'; 'q'; 'p'; 'o'; 'n'; 'm'; 'l'; 'k'; 'j'; 'i'; 'h'; 'g'];
  check_ok ('z', 'h', (-2)) ['z'; 'x'; 'v'; 't'; 'r'; 'p'; 'n'; 'l'; 'j'; 'h'];
  check_ok ('w', 'e', 1) ['e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'];
  check_ok ('t', 'p', 2) ['p'; 'r'; 't'];
  check_ok ('z', 'o', (-7)) ['z'; 's'];
  check_ok ('k', 'g', 1) ['g'; 'h'; 'i'; 'j'; 'k'];
  check_ok ('b', 'f', (-4)) ['f'; 'b'];
  check_ok ('H', 'Z', (-13)) ['Z'; 'M'];
  check_ok ('R', 'B', 5) ['B'; 'G'; 'L'; 'Q'];
  check_ok ('p', 'm', (-3)) ['p'; 'm'];
  check_ok ('U', 'C', 3) ['C'; 'F'; 'I'; 'L'; 'O'; 'R'; 'U'];
  check_ok ('O', 'Q', (-1)) ['Q'; 'P'; 'O'];
  check_ok ('T', 'G', 10) ['G'; 'Q'];
  check_ok ('e', 'p', 5) ['e'; 'j'; 'o'];
  check_ok ('w', 'k', 5) ['k'; 'p'; 'u'];
  check_ok ('m', 'u', (-1)) ['u'; 't'; 's'; 'r'; 'q'; 'p'; 'o'; 'n'; 'm'];
  check_ok ('y', 'b', 11) ['b'; 'm'; 'x'];
  check_ok ('T', 'F', 12) ['F'; 'R'];
  check_ok ('q', 'e', 12) ['e'; 'q'];
  check_ok ('x', 'd', 1) ['d'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'];
  check_ok ('L', 'W', 4) ['L'; 'P'; 'T'];
  check_ok ('c', 'k', (-2)) ['k'; 'i'; 'g'; 'e'; 'c'];
  check_ok ('m', 'q', (-1)) ['q'; 'p'; 'o'; 'n'; 'm'];
  check_ok ('U', 'C', (-5)) ['U'; 'P'; 'K'; 'F'];
  check_ok ('y', 'g', 1) ['g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'];
  check_ok ('Q', 'C', 14) ['C'; 'Q'];
  check_ok ('v', 'j', 7) ['j'; 'q'];
  check_ok ('Q', 'A', 7) ['A'; 'H'; 'O'];
  check_ok ('r', 'h', 1) ['h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'];
  check_ok ('o', 'b', 14) ['b'];
  check_ok ('Z', 'S', 12) ['S'];
  check_ok ('y', 'r', 21) ['r'];
  check_ok ('K', 'Y', (-4)) ['Y'; 'U'; 'Q'; 'M'];
  check_ok ('q', 'h', (-24)) ['q'];
  check_ok ('J', 'V', 6) ['J'; 'P'; 'V'];
  check_ok ('c', 'h', (-9)) ['h'];
  check_ok ('Z', 'D', (-22)) ['Z'; 'D'];
  check_ok ('h', 'l', (-6)) ['l'];
  check_ok ('F', 'X', 12) ['F'; 'R'];
  check_ok ('d', 'k', 1) ['d'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'];
  check_ok ('W', 'L', (-19)) ['W'];
  check_ok ('p', 'z', (-4)) ['z'; 'v'; 'r'];
  check_ok ('E', 'N', (-9)) ['N'; 'E'];
  check_ok ('l', 'a', (-12)) ['l'];
  check_ok ('W', 'P', 16) ['P'];
  check_ok ('x', 'c', (-6)) ['x'; 'r'; 'l'; 'f'];
  check_ok ('N', 'U', 4) ['N'; 'R'];
  check_ok ('v', 'm', (-22)) ['v'];
  check_ok ('R', 'Q', 13) ['Q'];
  check_ok ('n', 'j', 22) ['j'];
  check_ok ('D', 'P', (-9)) ['P'; 'G'];
  check_ok ('x', 'o', (-7)) ['x'; 'q'];
  check_ok ('I', 'T', (-1)) ['T'; 'S'; 'R'; 'Q'; 'P'; 'O'; 'N'; 'M'; 'L'; 'K'; 'J'; 'I'];
  check_ok ('n', 'i', 14) ['i'];
  check_ok ('C', 'Z', (-4)) ['Z'; 'V'; 'R'; 'N'; 'J'; 'F'];
  check_ok ('a', 'u', (-24)) ['u'];
  check_ok ('Q', 'C', (-15)) ['Q'];
  check_ok ('x', 'i', 1) ['i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'];
  check_ok ('C', 'E', (-2)) ['E'; 'C'];
  check_ok ('i', 'u', (-20)) ['u'];
  check_ok ('Q', 'G', 4) ['G'; 'K'; 'O'];
  check_ok ('j', 'x', 14) ['j'; 'x'];
  check_ok ('b', 'y', (-11)) ['y'; 'n'; 'c'];
  check_ok ('Q', 'A', (-7)) ['Q'; 'J'; 'C'];
  check_ok ('f', 'c', 1) ['c'; 'd'; 'e'; 'f'];
  check_error ('G', 'V', 0) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('N', 'I', (-30)) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('n', 'c', (-29)) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('F', 'L', (-29)) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('O', 'Y', (-27)) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('a', 't', 27) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('Y', 'G', (-30)) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('X', 'S', 0) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('r', 'g', 0) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('Y', 'M', (-30)) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('Q', 'D', (-30)) "step must be a non-zero value between -26 and 26, exclusive";
  check_error ('X', 'w', 6) "both start and stop must share the same case";
  check_error ('v', 'B', (-8)) "both start and stop must share the same case";
  check_error ('h', 'E', 7) "both start and stop must share the same case";
  check_error ('R', 'o', 7) "both start and stop must share the same case";
  ()

let () =
  run "Alpha-Range"
    [ ("all tests", [ test_case "basic examples" `Quick test_alpha_range ]) ]
