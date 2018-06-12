#!/bin/bash

ORI_PATH=
DES_PATH=

#add repo and install
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.utexas.edu/mariadb/repo/10.1/ubuntu xenial main'
sudo apt update && sudo apt upgrade -y && sudo apt install -y mariadb-server rsync
sudo mysql_secure_installation

#link to backup DB
sudo mount $ORI_PATH $DES_PATH

#open port in fw
sudo ufw allow 3306/tcp
sudo ufw allow 4444/tcp
sudo ufw allow 4567/tcp
sudo ufw allow 4568/tcp
sudo ufw allow 4567/udp
