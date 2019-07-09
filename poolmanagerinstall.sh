#! /bin/bash

sudo apt update -y
sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo useradd -m -s /bin/bash mongo
sudo apt install -y npm git nodejs mongodb
sudo su - mongo << EOF
git clone https://github.com/yamileon/poolmanager-api.git
cd poolmanager-api/ | sudo git checkout dev 
npm install
EOF
sudo cp ~/poolmanagersetup/api.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable api
sudo systemctl start api
