#!/usr/bin/env bash
#
# Capture and print stdout, since modernize doesn't use proper exit codes
#
set -e -o pipefail

if ! command -v modernize &> /dev/null ; then
    echo "modernize not installed or available in the PATH or GOPATH" >&2
    echo "please run go install golang.org/x/tools/gopls/internal/analysis/modernize/cmd/modernize@latest" >&2
    exit 1
fi

output="$(modernize "$@")"
echo "$output"
[[ -z "$output" ]]
