(lang dune 3.23)

(name learncaml)

(generate_opam_files true)

(source
 (github tautastic/learncaml))

(authors "TauTastic <tautastic@proton.me>")

(maintainers "TauTastic <tautastic@proton.me>")

(license LICENSE)

(documentation https://github.com/tautastic/learncaml/blob/main/README.md)

(package
 (name learncaml)
 (synopsis "Learn OCaml by solving coding challenges from LeetCode and Edabit")
 (description
  "A collection of OCaml solutions to programming challenges (LeetCode, Edabit, etc.), designed to help learn OCaml through practice. Includes a local development setup with Dune and Alcotest for fast, incremental testing.")
 (depends
  ocaml
  (alcotest :with-test))
 (tags
  ("ocaml" "learning" "challenges" "edabit" "leetcode" "dune" "alcotest")))
