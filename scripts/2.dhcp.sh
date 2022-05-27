#!/bin/bash

cp ../config/dhcpd.conf /etc/dhcp/dhcpd.conf
cp ../config/isc-dhcp-server /etc/default/isc-dhcp-server

systemctl stop isc-dhcp-server
systemctl start isc-dhcp-server

