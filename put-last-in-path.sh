#!/usr/bin/env bash

put-last-in-path() {
  path="$1"
  putlast="$2"
  # if there are spaces in path, don't even try
  echo -n "${path}" | \
    awk -v RS=':' \
        -v ORS=':' \
        -v putlast="${putlast}" \
    '$0 !~ putlast {print}'
  echo "${putlast}"
}