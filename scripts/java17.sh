#!/bin/bash
# installs openjdk17
# sudo bash java17.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root" && exit 1

add-apt-repository -y ppa:openjdk-r/ppa
apt install -y openjdk-17-jdk
