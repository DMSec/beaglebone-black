#!/bin/bash

echo "Update repository apt"
sudo apt-get update
sudo apt-get upgrade -y

echo "Install some packages"
sudo apt-get install python-software-properties software-properties-common wireless-tools usbutils wpasupplicant -y
sudo sudo apt install -y linux-headers-$(uname -r) build-essential dkms git libelf-dev
sudo add-apt-repository ppa:kelebek333/kablosuz



