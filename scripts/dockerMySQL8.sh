#!/bin/bash
# Ubuntu 20.04 amd64 install of mysql8 in docker container
# instructions from: https://dev.mysql.com/doc/mysql-installation-excerpt/8.0/en/docker-mysql-getting-started.html
# run with
#    sudo bash dockerMySQL8.sh
VERSION=8.0.32
docker pull mysql:${VERSION}

echo "docker run --name mysql_wsl2_i1 -d mysql/mysql-server:${VERSION} --character-set-server=utf8mb4 --collation-server=utf8mb4_col"
