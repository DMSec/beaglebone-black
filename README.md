# beaglebone-black
A repository with scripts, tools and programs to use with my beaglebone black


## Beaglebone black rev c

## access the beablebone with usb over internet

## Connect your usb dongle TL-WN722N to wifi network

sudo su

connmanctl scan wifi
connmanctl agents on
connmanctl services
connmanctl connect xxxxxxxxxxxx
connmanctl quit

### update and prepare the linux headers

apt update
apt upgrade -y
apt install linux-headers-$(uname -r)


### Install manually the driver wifi

git clone https://github.com/lwfinger/rtl8188eu.git
cd rtl8188eu
git checkout v5.2.2.4
make all
make install











    



                

