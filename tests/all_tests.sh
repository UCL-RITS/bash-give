#!/bin/bash

set -o nounset \
    -o errexit \
    -o pipefail

PARENT_DIR="$TRAVIS_BUILD_DIR"
TEST_DIR="$TRAVIS_BUILD_DIR/tests"

export PATH="$PARENT_DIR:$PATH"

"$TEST_DIR/setup.sh"

"$TEST_DIR/test_1.sh"
