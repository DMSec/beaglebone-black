#!/bin/szh

szh --version

echo "Update repository apt"
sudo apt-get update

echo "Installing the wifi libraries"
sudo apt-get install wireless-tools usbutils

echo "Download firmware and install"
sudo apt-get install firmware-atheros
sudo wget http://linuxwireless.org/download/htc_fw/1.3/htc_9271.fw
sudo cp htc_9271.fw /lib/firmware

echo "Backup the original file interface"
sudo cp /etc/network/interface /etc/network/interface.bkp
echo "Copy the custom interface file to /etc/network/interface"
sudo cp config/interface /etc/network/interface

sudo iwconfig

sudo connmanctl disable wifi
sudo connmanctl enable wifi
sudo ifup wlan0