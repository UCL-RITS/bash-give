#!/bin/bash

sudo -u user_1 bash <<<"sha256sum >test_file <<<$RANDOM"
sudo -u user_1 give user_2 test_file
sudo -u user_2 take user_1 test_file

