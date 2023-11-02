#!/bin/bash 
# Ubuntu 20.04 amd64 install of awscli v2
# run with
#    sudo bash awscli.sh

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -d /tmp /tmp/awscliv2.zip

chmod +x /tmp/aws/install

bash /tmp/aws/install
# we can update with 
#    sudo bash /tmp/aws/install --update

aws --version

# deleting config files
rm -rf /tmp/awscliv2.zip /tmp/aws

# now configure your aws cli installation
# login to your aws management console and retrieve your aws access key id and secret access key
# if it isn't created, create it it
echo "Now run the command"
echo "aws configure"



# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html