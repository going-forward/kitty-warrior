# kitty-warrior


## Setup environment

1. Login under root
1. Select username for your accout. For example `andrew`.


```
adduser andrew
adduser andrew sudo

# login as andrew

# Then

# install docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -y docker-ce
sudo systemctl status docker

# add user to "docker" group

sudo usermod -aG docker ${USER}
su - ${USER}

```

## Setup project for attack

1. Clone repository
2. Edit list of targets in `resources.txt`

```
git clone https://github.com/going-forward/kitty-warrior.git

cd kitty-warrior
./run_all.sh
```
