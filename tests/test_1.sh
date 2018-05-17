#!/bin/bash

sudo --non-interactive --user=user_1 bash <<<"sha256sum >~/test_file <<<$RANDOM"
sudo --non-interactive --user=user_1 "$PARENT_DIR/give" user_2 ~/test_file
sudo --non-interactive --user=user_2 "$PARENT_DIR/take" user_1 test_file

