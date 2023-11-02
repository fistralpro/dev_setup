#!/bin/bash 
# Ubuntu 20.04 amd64 install of awsSAM
# run with
#    sudo bash awsSAM.sh

curl -L "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o "/tmp/awsSAM.zip"
unzip /tmp/awsSAM.zip -d /tmp/awsSAM

chmod +x /tmp/awsSAM/install

bash /tmp/awsSAM/install

sam --version

rm -rf /tmp/awsSAM.zip /tmp/awsSAM