#!/bin/bash

sudo --non-interactive --user=user_1 cp "$TESTS_DIR/test_data" ~user_1/
sudo --non-interactive --user=user_1 "$PARENT_DIR/give" user_2 ~user_1/test_data
sudo --non-interactive --user=user_2 bash -c "cd ~user_2; \"$PARENT_DIR/take\" user_1 test_data"

sudo --non-interactive diff ~user_1/test_data ~user_2/test_data

