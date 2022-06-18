#!/bin/bash

cp ../config/traffic-internet.service /etc/systemd/system/
chmod 644 /etc/systemd/system/traffic-internet.service
systemctl enable traffic-internet.service
systemctl start traffic-internet.service
