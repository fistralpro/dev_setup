#!/bin/bash
# Ubuntu 20.04 amd64 install of SDKMan (auto installs zip)
# run with
#    ./sdkman.sh

echo "install zip"
sudo apt update
sudo apt install zip

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk version

echo "# List all versions:"
echo "sdk list java"
echo ""
echo "# Install version"
echo "sdk install java 8.0.382-amzn"
echo ""
echo "# Uninstall"
echo "sdk uninstall java 8.0.382-amzn"
echo ""
echo "# Set default (not just in terminal)"
echo "sdk default java 8.0.382-amzn"