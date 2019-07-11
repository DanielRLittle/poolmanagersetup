#! /bin/bash

sudo apt update -y 
sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo seradd -m -s /bin/bash angular
sudo apt install -y nodejs
sudo apt install -y npm
no | sudo npm install -g @angular/cli
sudo su - angular <<EOF
rm -rf poolmanage-ui
git clone https://github.com/yamileon/poolmanage-ui.git
cd poolmanage-ui/
git checkout furr-dev2
no | npm install
EOF
sudo cp ~/poolmanagersetup/ui.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable ui
sudo systemctl restart ui

