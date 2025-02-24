#!/usr/bin/env bash
#
# Capture and print stdout, since goimports-reviser doesn't use proper exit codes
#
set -e -o pipefail

if ! command -v goimports-reviser &> /dev/null ; then
    echo "goimports-reviser not installed or available in the PATH" >&2
    echo "please check https://github.com/incu6us/goimports-reviser" >&2
    exit 1
fi

output="$(goimports-reviser "$@")"
echo "$output"
[[ -z "$output" ]]