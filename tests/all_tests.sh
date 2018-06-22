#!/bin/bash

set -o nounset \
    -o errexit \
    -o pipefail \


export PARENT_DIR="$TRAVIS_BUILD_DIR"
export TESTS_DIR="$TRAVIS_BUILD_DIR/tests"

export PATH="$PARENT_DIR:$PATH"

export GIFT_STORE="/gift-store"

#===================================
# Defs for better error reporting
#===================================

export debug_mode=1

function error() {
  echo "Error: $*" >&2
  [[ "${debug_mode:-0}" -eq 1 ]] && callstack
  exit 1
}

function callstack() {
    echo --- Trace: ---
    local i
    # These indexes start at 0 but 0 is this callstack function, so skip it.
    for ((i=1; i<${#FUNCNAME[*]}; i++)) do
        if [ $i -ne 1 ]; then
            echo -n "  "  
        fi
        echo "${BASH_SOURCE[$i]}: in \"${FUNCNAME[$i]}\" called from line ${BASH_LINENO[$i]}"
    done
    echo --------------
}

[[ "${debug_mode:-0}" -eq 1 ]] && trap callstack ERR

#==================================

printf "Using gift store: %s\n" "$GIFT_STORE"

printf "Running test setup..."
source "$TESTS_DIR/setup.sh"
printf "\n"

printf "Test 1..."
source "$TESTS_DIR/test_1.sh"
printf "\n"

printf "Test 2..."
source "$TESTS_DIR/test_2.sh"
printf "\n"
