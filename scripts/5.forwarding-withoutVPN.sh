#!/bin/bash

echo "Telling kernel to turn on ipv4 ip_forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Done. Setting up iptables rules to allow FORWARDING"

DOWNSTREAM=wlan0 # wlan0 is client network (running hostapd)
UPSTREAM=eth0 # eth0 is upstream network (internet)

echo  "Allow IP Masquerading (NAT) of packets from clients (downstream) to upstream network (internet)"
iptables -t nat -A POSTROUTING -o $UPSTREAM -j MASQUERADE

echo "Forward packets from downstream clients to the upstream internet"
iptables -A FORWARD -i $DOWNSTREAM -o $UPSTREAM -j ACCEPT

echo "Forward packers from the internet to clients IF THE CONNECTION IS ALREADY OPEN!"
iptables -A FORWARD -i $UPSTREAM  -o $DOWNSTREAM -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "Done setting up iptables rules. Forwarding enabled"