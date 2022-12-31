#!/bin/bash
# Ubuntu install of eclipse temurin (other recommended is Amazon Corretto)
# instructions from: https://adoptium.net/installation/linux/
# run with
#    sudo bash java17.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root" && exit 1

apt install -y wget apt-transport-https

mkdir -p /etc/apt/keyrings
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc

echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

apt update 
apt install temurin-17-jdk

