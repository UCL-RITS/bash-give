#!/bin/bash

source settings.sh

for loop_user in user_1 user_2 user_3; do
    sudo useradd --create-home --user-group $loop_user
done

sudo mkdir -p "$SPOOL_DIR"
sudo chmod 1777 "$SPOOL_DIR"

