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

```bash
$ ./new-challenge.sh
==> Creating a new OCaml challenge stub
Challenge name: Sum of Two Numbers
Description (one line, optional):
Create a function that takes two numbers as arguments and returns their sum.
Function signature (e.g., 'addition a b : int' or 'convert minutes'):
addition a b : int
Enter test cases...
  0 0 -> 0
  2 3 -> 5
  (-3) (-6) -> (-9)
  88 2 -> 90


==> Creating ./challenges/0001-sum-of-two-numbers
```

After creation, edit `challenges/0001-sum-of-two-numbers/solution.ml` to replace `failwith "not implemented"` with your solution, then run `dune test`.
