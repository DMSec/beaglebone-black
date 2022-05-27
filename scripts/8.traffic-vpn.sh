#!/bin/bash

./4.iptables-clear.sh

echo "Telling kernel to turn on ipv4 ip_forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Done. Setting up iptables rules to allow FORWARDING"

DOWNSTREAM=wlan0 # wlan0 is client network (running hostapd)
VPN=tun0 # tunnel vpn

echo "Masquerade outgoing traffic - wlan0 and tun0"
iptables -t nat -A POSTROUTING -o $DOWNSTREAM -j MASQUERADE
iptables -t nat -A POSTROUTING -o $VPN -j MASQUERADE

echo "Allow return traffic- wlan0 and tun0"
iptables -A INPUT -i $DOWNSTREAM -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i $VPN -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "Forward everything"
iptables -A FORWARD -j ACCEPT