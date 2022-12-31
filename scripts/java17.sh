#!/bin/bash
# installs openjdk17
# sudo bash java17.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root" && exit 1

sudo apt install libc6-i386 libc6-x32 curl -y
cd /tmp
curl  -O https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz
tar -xvf jdk-17_linux-x64_bin.tar.gz
sudo mv jdk-17.* /opt/jdk17
export JAVA_HOME=/opt/jdk17
export PATH=$PATH:$JAVA_HOME/bin

echo "Installed:"
java --version
echo $JAVA_HOME

