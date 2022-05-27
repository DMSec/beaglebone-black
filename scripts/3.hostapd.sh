#!/bin/bash

cp ../config/hostapd.conf /etc/hostapd/hostapd.conf

echo "Enable hostapd as a service"

systemctl unmask hostapd
systemctl enable hostapd
systemctl stop hostapd
systemctl start hostapd

echo "Enabled hostapd as a service"