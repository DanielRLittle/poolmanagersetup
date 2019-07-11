#! /bin/bash

sudo apt update -y
sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo useradd -m -s /bin/bash mongo
sudo apt install -y git
sudo apt install -y nodejs
sudo apt install -y npm
sudo apt install -y mongodb
sudo su - mongo << EOF
rm -rf poolmanager-api
git clone https://github.com/yamileon/poolmanager-api.git
cd poolmanager-api/
git checkout dev
npm install
EOF
sudo cp ~/poolmanagersetup/api.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable api
sudo systemctl restart api

yes | sudo npm install -g @angular/cli
sudo su - mongo << EOF
rm -rf poolmanage-ui
git clone https://github.com/yamileon/poolmanage-ui.git
cd poolmanage-ui/
git checkout furr-dev2
yes | npm install
EOF
sudo cp ~/poolmanagersetup/ui.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable ui
sudo systemctl restart ui

