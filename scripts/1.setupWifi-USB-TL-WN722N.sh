#!/bin/bash

cp ../config/interfaces /etc/network/interfaces

# You can use the file ../drivers/rt8188eu-5.2.2.4.zip or using the process below
git clone https://github.com/lwfinger/rtl8188eu.git

cd rtl8188eu

git checkout v5.2.2.4

echo "blacklist r8188eu" > /etc/modprobe.d/blacklist.conf

make all

make install