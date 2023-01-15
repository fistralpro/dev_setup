#!/bin/bash
# Ubuntu 20.04 amd64 install of eclipse temurin (other recommended is Amazon Corretto)
# instructions from: https://adoptium.net/installation/linux/
# run with
#    ./java17.sh

echo "install apt-transport-https"
sudo pt install -y wget apt-transport-https

echo "create keyrings directory"
sudo mkdir -p /etc/apt/keyrings
echo "adding adoptium.asc"
sudo wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo tee /etc/apt/keyrings/adoptium.asc

echo "adding adoptium list"
sudo echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

sudo apt update 
sudo apt install temurin-17-jdk

echo "export JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-amd64" >> ~/.bashrc
echo 'export PATH="$PATH":/usr/lib/jvm/temurin-17-jdk-amd64/bin' >> ~/.bashrc
source ~/.bashrc 

echo "Installed:"
java --version
echo $JAVA_HOME

echo "Any issues you may have multiple versions of java"
echo "You may want to try selecting the version with: "
echo "     sudo update-alternatives --config java"
