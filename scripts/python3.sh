#!/bin/bash
# Ubuntu 20.04 amd64 install of nodejs
# run with
#    sudo bash node.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root e.g: sudo bash python3.sh" && exit 1

sudo apt update
sudo apt -y upgrade
sudo apt install -y python3-pip
sudo apt install -y  build-essential libssl-dev libffi-dev python3-dev python3-venv

#Venv instructions
# mkdir environments
# cd environments
# python3 -m venv my_env
# source my_env/bin/activate
