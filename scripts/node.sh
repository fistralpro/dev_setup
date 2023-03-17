#!/bin/bash
# Ubuntu 20.04 amd64 install of nodejs
# run with
#    sudo bash node.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root e.g: sudo bash gradle7.sh" && exit 1

sudo apt update
sudo apt install -y nodejs npm
node --version