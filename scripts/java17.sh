#!/bin/bash
# Ubuntu 20.04 amd64 install of eclipse temurin (other recommended is Amazon Corretto)
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

echo "export JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-amd64" >> ~/.bashrc
echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc
source ~/.bashrc 

echo "Installed:"
java --version
echo $JAVA_HOME

echo "Any issues you may have multiple versions of java"
echo "You may want to try selecting the version with: "
echo "     sudo update-alternatives --config java"
