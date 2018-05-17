#!/bin/bash

set -o nounset \
    -o errexit \
    -o pipefail \


export PARENT_DIR="$TRAVIS_BUILD_DIR"
export TESTS_DIR="$TRAVIS_BUILD_DIR/tests"

export PATH="$PARENT_DIR:$PATH"

export GIFT_STORE="/gift-store"

"$TESTS_DIR/setup.sh"

"$TESTS_DIR/test_1.sh"
