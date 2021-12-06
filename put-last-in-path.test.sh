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
run_test "should:fail" "should" "wrong:wrong"
run_test "a:b:c" "b" "a:c:b"
run_test "/Users/douglasnaphas/.nvm/versions/node/v16.13.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/douglasnaphas/.nvm/versions/node/v12.22.7/bin" \
        "/usr/bin" \
        "/Users/douglasnaphas/.nvm/versions/node/v16.13.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:/Users/douglasnaphas/.nvm/versions/node/v12.22.7/bin:/usr/bin"
# spaces in path


