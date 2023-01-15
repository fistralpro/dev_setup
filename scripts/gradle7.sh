#!/bin/bash
# Ubuntu 20.04 amd64 install of gradle
# instructions from: https://gradle.org/install/
# run with
#    sudo bash gradle7.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root e.g: sudo bash gradle7.sh" && exit 1

VERSION=7.6

wget https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip -P /tmp
unzip -d /opt/gradle /tmp/gradle-${VERSION}-bin.zip

ln -s /opt/gradle/gradle-${VERSION} /opt/gradle/latest
echo "export GRADLE_HOME=/opt/gradle/latest" > /etc/profile.d/gradle.sh
echo 'export PATH=/opt/gradle/latest/bin:"${PATH}"' >> /etc/profile.d/gradle.sh
chmod +x /etc/profile.d/gradle.sh

source /etc/profile.d/gradle.sh
gradle --v
