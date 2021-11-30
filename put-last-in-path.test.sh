#!/usr/bin/env bash
set -e
source put-last-in-path.sh
run_test() {
  path="$1"
  putlast="$2"
  expected="$3"
  actual="$(put-last-in-path ${path} ${putlast})"
  if [[ "${expected}" != "${actual}" ]]
  then
    echo "expected ${expected}"
    echo "from path ${path}"
    echo "and putlast ${putlast}"
    echo "got ${actual}"
    exit 2
  fi
}
run_test "a" "a" "a"
run_test "a:b:c" "b" "a:c:b"
# spaces in path


