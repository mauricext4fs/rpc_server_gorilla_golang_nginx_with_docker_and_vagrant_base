#!/usr/bin/env bash

echo "Removing this damn Nano"
apt-get remove nano

echo "Installing latest version from Docker"
curl -fsSL https://get.docker.com/ | sh

echo "Installing latest version of docker-compose"
curl -fsSL https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker vagrant

echo "Finish"
