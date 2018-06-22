#!/bin/bash

sudo --non-interactive --user=user_1 cp "$TESTS_DIR/test_data" ~user_1/
sudo --non-interactive --user=user_1 GIFT_STORE="$GIFT_STORE" "$PARENT_DIR/give" user_2 ~user_1/test_data
sudo --non-interactive --user=user_2 bash -c "export GIFT_STORE=\"$GIFT_STORE\"; cd ~user_2; \"$PARENT_DIR/take\" user_1 test_data"

sudo --non-interactive diff ~user_1/test_data ~user_2/test_data

sudo --non-interactive rm -rf "$GIFT_STORE/*" ~user_1/test_data ~user_2/test_data
