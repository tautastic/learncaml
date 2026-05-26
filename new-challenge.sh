#!/usr/bin/env zsh

setopt err_exit

challenges_dir="./challenges"

get_next_number() {
  local max_num=0
  for d in "$challenges_dir"/[0-9][0-9][0-9][0-9]-*(N); do
    if [[ -d "$d" ]]; then
      local base=$(basename "$d")
      local num=${base%%-*}
      if [[ $num -gt $max_num ]]; then
        max_num=$num
      fi
    fi
  done
  printf "%04d" $((max_num + 1))
}

echo "==> Creating a new OCaml challenge stub"

# Challenge name
while true; do
  read "challenge_name?Challenge name: "
  [[ -n "$challenge_name" ]] && break
  echo "   Please enter a non-empty name."
done

# Description
echo "Description (one line, optional):"
read "description"

# Bare signature (without 'let' and without trailing '=')
echo "Function signature (e.g., 'addition a b : int' or 'convert minutes'):"
read "bare_sig"
while [[ -z "$bare_sig" ]]; do
  echo "Signature cannot be empty."
  read "bare_sig"
done

# Extract function name: first word (alphanumeric + underscore)
func_name=$(echo "$bare_sig" | awk '{print $1}')
if [[ -z "$func_name" ]]; then
  echo "ERROR: Could not extract function name."
  exit 1
fi

# Construct full let line: "let signature ="
let_line="let $bare_sig ="

# Test cases
echo "Enter test cases. For each, provide arguments separated by spaces, then '->', then expected value."
echo "Examples:"
echo "  Single arg:   5 -> 1825"
echo "  Two args:     2 3 -> 5"
echo "  String:       \"hello\" -> \"HELLO\""
echo "Finish with an empty line."
test_cases=()
while true; do
  read "line?  "
  [[ -z "$line" ]] && break
  test_cases+=("$line")
done

if [[ ${#test_cases[@]} -eq 0 ]]; then
  echo "ERROR: No test cases provided."
  exit 1
fi

# Create directory
mkdir -p "$challenges_dir"
next_num=$(get_next_number)
slug=$(echo "$challenge_name" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
dir_name="${next_num}-${slug}"
full_path="${challenges_dir}/${dir_name}"

if [[ -d "$full_path" ]]; then
  echo "ERROR: directory $full_path already exists"
  exit 1
fi

echo "==> Creating $full_path"
mkdir -p "$full_path"

# Write dune
cat > "$full_path/dune" <<EOF
(test
 (name test)
 (libraries alcotest)
 (modules solution test)
 (package learncaml))
EOF

# Write solution.ml – full let line with failwith body
cat > "$full_path/solution.ml" <<EOF
(*
   Challenge: $challenge_name
   $description
*)

$let_line
  failwith "not implemented"

EOF

# Write test.ml using plain asserts (works for any type)
test_content="open Alcotest\n\n"
test_content+="let test_$func_name () =\n"

for tc in "${test_cases[@]}"; do
  # Split at '->'
  left="${tc%%->*}"
  right="${tc#*->}"
  # Trim spaces
  left="$(echo -n "$left" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  right="$(echo -n "$right" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

  # Split left into arguments (space-separated)
  args=()
  for a in ${(s: :)left}; do
    args+=("$a")
  done

  # Build function call: Solution.func arg1 arg2 ...
  call="Solution.$func_name ${args[@]}"

  # Generate assertion
  test_content+="  assert ($call = $right);\n"
done

test_content+="  ()\n\n"
test_content+="let () =\n"
test_content+="  run \"$challenge_name\"\n"
test_content+="    [ (\"All Tests\", [ test_case \"All Tests\" \`Quick test_$func_name ]) ]\n"

echo -e "$test_content" > "$full_path/test.ml"

echo "==> Done. Created $full_path"
echo "==> Next steps:"
echo "    1. Edit $full_path/solution.ml to implement $func_name"
echo "    2. Run 'dune test' from project root"
