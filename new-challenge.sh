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

infer_type() {
  local expected="$1"
  local lower=$(echo "$expected" | tr '[:upper:]' '[:lower:]')
  if [[ "$expected" =~ '^".*"$' ]]; then
    type_name="string"
  elif [[ "$lower" == "true" || "$lower" == "false" ]]; then
    type_name="bool"
  elif [[ "$expected" =~ '^[+-]?[0-9]+$' ]]; then
    type_name="int"
  else
    type_name="eq"
  fi
}

echo "==> Creating a new OCaml challenge stub"

while true; do
  read "challenge_name?Challenge name: "
  [[ -n "$challenge_name" ]] && break
  echo "   Please enter a non-empty name."
done

echo "Description (one line, optional):"
read "description"

echo "Function signature (e.g., 'addition a b : int' or 'convert minutes'):"
read "bare_sig"
while [[ -z "$bare_sig" ]]; do
  echo "Signature cannot be empty."
  read "bare_sig"
done

func_name=$(echo "$bare_sig" | awk '{print $1}')
if [[ -z "$func_name" ]]; then
  echo "ERROR: Could not extract function name."
  exit 1
fi

let_line="let $bare_sig ="

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

first_expected="${test_cases[1]#*->}"
first_expected="$(echo -n "$first_expected" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
infer_type "$first_expected"
return_type="$type_name"

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

cat > "$full_path/dune" <<EOF
(test
 (name test)
 (libraries alcotest)
 (modules solution test)
 (package learncaml))
EOF

cat > "$full_path/solution.ml" <<EOF
(*
   Challenge: $challenge_name
   $description
*)

$let_line
  failwith "not implemented"

EOF

test_content="open Alcotest\n"

if [[ "$return_type" == "eq" ]]; then
  test_content+="\nlet check_eq label expected actual =\n"
  test_content+="  check bool (Printf.sprintf \"expected %s, got %s\" (string_of expected) (string_of actual)) (actual = expected)\n"
fi

test_content+="\nlet test_$func_name () =\n"

for tc in "${test_cases[@]}"; do
  left="${tc%%->*}"
  right="${tc#*->}"
  left="$(echo -n "$left" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  right="$(echo -n "$right" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

  label="${left} -> ${right}"

  args=()
  for a in ${(s: :)left}; do
    args+=("$a")
  done

  call="Solution.$func_name ${args[@]}"

  case "$return_type" in
    int)
      test_content+="  check int \"$label\" $right ($call);\n"
      ;;
    bool)
      test_content+="  check bool \"$label\" $right ($call);\n"
      ;;
    string)
      test_content+="  check string \"$label\" $right ($call);\n"
      ;;
    eq)
      test_content+="  check_eq \"$label\" $right ($call);\n"
      ;;
  esac
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
