#!/bin/bash

sudo --non-interactive --user=user_1 cp "$TEST_DIR/test_data" ~user_1/
sudo --non-interactive --user=user_1 "$PARENT_DIR/give" user_2 ~user_1/test_file
sudo --non-interactive --user=user_2 "$PARENT_DIR/take" user_1 test_file

