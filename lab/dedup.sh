#!/bin/bash

function dedup_awk ()
{
  echo "$1" | awk -v RS=: \
    'BEGIN { first_entry = 1; }
    {
      if(! a[$0]) {
        a[$0] = 1;
        if(first_entry) {
          first_entry = 0;
        } else {
          printf(":");
        }
        printf("%s", $0);
      }
    }'
}

function run_test ()
{
  INPUT="$1"
  EXPECTED="$2"
  ACTUAL="$(dedup_awk ${INPUT})"
  if [[ "${ACTUAL}" != "${EXPECTED}" ]]
  then
    echo "test failed"
    echo "input: ${INPUT}"
    echo "expected: ${EXPECTED}"
    echo "got: ${ACTUAL}"
    exit 1
  fi
}

PATH=/Users/dougnaphas/.rbenv/shims:/Users/dougnaphas/Library/Python/2.7/bin:/Users/dougnaphas/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
EXPECTED=/Users/dougnaphas/.rbenv/shims:/Users/dougnaphas/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
run_test ${PATH} ${EXPECTED}
run_test ${EXPECTED} ${EXPECTED}
run_test "/a/b/c:a:b:c:b:/a/b/c:b:b:d" "/a/b/c:a:b:c:d"
