#!/bin/bash

sudo --non-interactive chmod a+rx "$PARENT_DIR"

for loop_user in user_1 user_2 user_3; do
    sudo --non-interactive useradd --create-home --user-group $loop_user
done

sudo --non-interactive mkdir -p "$GIFT_STORE"
sudo --non-interactive chmod 1777 "$GIFT_STORE"

echo "--> Created gift store: $GIFT_STORE"
stat "$GIFT_STORE"

dir_stack="$PARENT_DIR"
declare -a dir_array
while [[ "$dir_stack" != "/" ]]; do
    dir_stack="$(dirname "$dir_stack")"
    dir_array+=("$dir_stack")
done

sudo chmod +rx "${dir_array[@]}"

