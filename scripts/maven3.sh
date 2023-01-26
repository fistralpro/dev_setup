#!/bin/bash
# Ubuntu 20.04 amd64 install of maven
# run with
#    sudo bash maven3.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root e.g: sudo bash maven3.sh" && exit

VERSION=3.8.7
JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-amd64
MAVEN_HOME=/opt/maven

echo ""
echo "Installing maven version: "$VERSION
echo "using JAVA_HOME of: "$JAVA_HOME
echo "*** If you are running a different Java_home, then amend this script ***"
echo ""
wget https://dlcdn.apache.org/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz -P /tmp
tar xf /tmp/apache-maven-*.tar.gz -C /opt

ln -s /opt/apache-maven-${VERSION} /opt/maven

ln -s /opt/gradle/gradle-${VERSION} /opt/gradle/latest

echo "export JAVA_HOME=${JAVA_HOME}" > /etc/profile.d/maven.sh
echo "export M2_HOME=${MAVEN_HOME}" >> /etc/profile.d/maven.sh
echo "export MAVEN_HOME=${MAVEN_HOME}" >> /etc/profile.d/maven.sh
echo "export PATH=${MAVEN_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh

echo "To use maven immediately you will need to source the file with:"
echo "source /etc/profile.d/maven.sh"
echo ""
echo "alternatively maven.sh with be picked up on restart"

