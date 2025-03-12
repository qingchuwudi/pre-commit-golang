#!/usr/bin/env bash
#
# Capture and print stdout, since govulncheck doesn't use proper exit codes
#
set -e -o pipefail

if ! command -v govulncheck &> /dev/null ; then
    echo "govulncheck not installed or available in the PATH" >&2
    echo "please check https://github.com/golang/vuln" >&2
    exit 1
fi

output="$(govulncheck "$@")"
echo "$output"
[[ -z "$output" ]]
