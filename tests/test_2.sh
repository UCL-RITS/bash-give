#!/bin/bash

# Tests for failure when gift dir for user_1 is owned by !user_1

sudo --non-interactive --user=user_3 mkdir -p "$GIFT_STORE"/"$(id -u user_1)"/"$(id -u user_2)"

sudo --non-interactive --user=user_1 cp "$TESTS_DIR/test_data" ~user_1/
! sudo --non-interactive --user=user_1 GIFT_STORE="$GIFT_STORE" "$PARENT_DIR/give" user_2 ~user_1/test_data
! sudo --non-interactive --user=user_2 bash -c "export GIFT_STORE=\"$GIFT_STORE\"; cd ~user_2; \"$PARENT_DIR/take\" user_1 test_data"
