#!/bin/bash

sudo iptables -F
sudo iptables -t nat -F
sudo iptables -X