#!/bin/bash


cp ../config/traffic-vpn.service /etc/systemd/system/
chmod 644 /etc/systemd/system/traffic-vpn.service

systemctl enable traffic-vpn.service
systemctl start traffic-vpn.service