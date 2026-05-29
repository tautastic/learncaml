# learncaml

Learn OCaml by solving coding challenges from LeetCode, Edabit, and similar sites.

## Quick start

1. Install OCaml and opam.
2. Install dependencies: `opam install dune alcotest ocamlformat`
3. Clone this repository.
4. Run `./new-challenge.sh` to create a new challenge stub (see below).
5. Implement the solution in the generated `solution.ml` file.
6. Run `dune test` to verify your solution.
7. Continue to the next challenge.

## Adding a new challenge

Use the `new-challenge.sh` script to create a properly structured challenge directory:

```text
$ ./new-challenge.sh
==> Creating a new OCaml challenge stub
Challenge name: Remainder of Two Numbers

Description (one line, optional):
Two numbers are passed as parameters. The first parameter divided by the second parameter will have a remainder, possibly zero. Return that value.

Function signature (e.g., 'addition a b : int' or 'convert minutes'):
remainder a b : int

Enter test cases. For each, provide arguments separated by spaces, then '->', then expected value.
Examples:
  Single arg:   5 -> 1825
  Two args:     2 3 -> 5
  String:       "hello" -> "HELLO"
Finish with an empty line.
  7 2 -> 1
  3 4 -> 3
  (-9) 45 -> (-9)
  5 5 -> 0

==> Creating ./challenges/0004-remainder-of-two-numbers
==> Done. Created ./challenges/0004-remainder-of-two-numbers
==> Next steps:
    1. Edit ./challenges/0004-remainder-of-two-numbers/solution.ml to implement remainder
    2. Run 'dune test --action-stdout-on-success=swallow' from project root
```
