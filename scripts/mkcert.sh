#!/bin/bash
# Ubuntu 20.04 amd64 install of mkcert
# run with
#    sudo bash mkcert.sh
[[ "$EUID" -ne 0 ]] && echo "This script must be run as root e.g: sudo bash mkcert.sh" && exit


apt install libnss3-tools -y

curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
chmod +x mkcert-v*-linux-amd64
sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert
mkcert - ln -s mkcert-v*-linux-amd64 mkcert
mkcert -install


# sample certificate for wordpress
# mkcert \
#>  -cert-file my-wordpress-blog.local.crt \
#>  -key-file my-wordpress-blog.local.key \
#>  my-wordpress-blog.local