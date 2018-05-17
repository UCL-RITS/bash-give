#!/bin/bash

export PATH="${0%/*}:${0%/*}/tests:$PATH"

./setup.sh

./test_1.sh
