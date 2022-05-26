#!/bin/bash

echo "Update repository apt"
apt update
apt upgrade -y
apt instal-y l linux-headers-$(uname -r) build-essential dkms git libelf-dev python-software-properties software-properties-common wireless-tools usbutils isc-dhcp-server hostapd




