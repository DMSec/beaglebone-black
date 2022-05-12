#!/bin/bash

echo "Download firmware and install gcc"
sudo apt-get install firmware-atheros gcc rtl8723de-dkms -y


sudo wget https://static.tp-link.com/TL-WN722N'(US)'_V2_161112_Linux.zip
sudo mv 'TL-WN722N(US)_V2_161112_Linux.zip' ../drivers/TL-WN722N_V2_161112_Linux.zip
unzip ../drivers/TL-WN722N_V2_161112_Linux.zip -d ../drivers/TL-WN722N_V2_161112_Linux

#cd ../drivers/TL-WN722N_V2_161112_Linux/rtl8188EUS_linux_v4.3.0.8_13968.20150417
#ls
#make
#make install

cd ../drivers
git clone https://github.com/morrownr/8812au-20210629.git
cd 8812au-20210629
sudo ./install-driver.sh

echo "Backup the original file interface"
#sudo cp /etc/network/interface /etc/network/interface.bkp
echo "Copy the custom interface file to /etc/network/interface"
#sudo cp config/interface /etc/network/interface

#sudo iwconfig

#sudo connmanctl disable wifi
#sudo connmanctl enable wifi
#sudo ifup wlan0