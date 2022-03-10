#!/bin/bash

server_ip="${1}"

ssh -T andrew@$server_ip <<_EOF_
echo "${2}" | sudo -S apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -y docker-ce
sudo systemctl status docker
sudo apt-get install -y nmap
sudo usermod -aG docker ${USER}
git clone https://github.com/going-forward/kitty-warrior.git ddos
_EOF_
