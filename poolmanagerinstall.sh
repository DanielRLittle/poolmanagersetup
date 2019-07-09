#! /bin/bash

sudo apt update -y
sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install git -y
sudo git clone https://github.com/yamileon/poolmanager-api.git
sudo cd poolmanager-api/
sudo ls
sudo npm install
sudo apt install mongodb -y
sudo git checkout dev
sudo cp ~/poolmanagersetup/api.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable api
sudo systemctl start api
