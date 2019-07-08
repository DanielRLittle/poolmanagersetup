#! /bin/bash

sudo apt update -y
sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install git -y
git clone https://github.com/yamileon/poolmanager-api.git
cd poolmanager-api
sudo npm install
sudo apt install mongodb -y
git checkout dev
sudo cp ~/poolmanagersetup/api.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start api
