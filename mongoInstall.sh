#! /bin/bash

sudo apt update -y
sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install git -y
sudo apt install -y mongodb
sudo chmod 777 /etc/mongodb.conf
cp ~/poolmanagersetup/mongodb.conf /etc/mongodb.conf

