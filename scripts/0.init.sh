#!/bin/bash

echo "Update repository apt"
apt update
apt upgrade -y
apt install -y linux-headers-$(uname -r) build-essential dkms git libelf-dev software-properties-common wireless-tools usbutils isc-dhcp-server hostapd




