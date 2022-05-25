# beaglebone-black
A repository with scripts, tools and programs to use with my beaglebone black


## Beaglebone black rev c

## access the beablebone with usb over internet

## Connect your usb dongle TL-WN722N to wifi network
```
sudo su

connmanctl scan wifi

connmanctl agents on

connmanctl services

connmanctl connect xxxxxxxxxxxx

connmanctl quit
```
### update and prepare the linux headers
```
apt update

apt upgrade -y

apt install linux-headers-$(uname -r)
```

### Install manually the driver wifi
```
git clone https://github.com/lwfinger/rtl8188eu.git

cd rtl8188eu

git checkout v5.2.2.4

echo "blacklist r8188eu" > /etc/modprobe.d/blacklist.conf

make all

make install
```

### disconnect from wifi now

```
connmanctl connect xxxxxxxxxxxx
```

### Enable type monitor to wifi adapter 
```
iwconfig wlan0 mode Master
```
### Config the networking

edit the file /etc/network/interfaces. "e.g my network eth0 plugged on Lan router is 192.168.15.0/24"
```
auto lo
iface lo inet loopback

auto wlan0
iface wlan0 inet static
    address 192.168.66.1
    netmask 255.255.255.0
    gateway 192.168.66.1
    wireless-mode Master
    dns-nameservers 1.1.1.1, 8.8.8.8
    
auto eth0
iface eth0 inet static
    address 192.168.15.66
    netmask 255.255.255.0
    gateway 192.168.15.1
    dns-nameservers 1.1.1.1, 8.8.8.8
```

## Config the hostapd

edit the file /etc/hostapd/hostapd.conf

```
interface=wlan0
#If this fails, try rt1871xdrv a 
driver=nl80211
# Name of the new network: best use the hostname
ssid=BeagleboneBProxy

# Pick a channel not already in use
channel=6
# Change to b for older devices?
hw_mode=g
macaddr_acl=0
auth_algs=3
# Disable this to insure the AP is visible:
ignore_broadcast_ssid=0

wpa=2
wpa_passphrase="yourpassword"
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
```
### Test manually the hostapd

```
/usr/sbin/hostapd /etc/hostapd/hostapd.conf
```

### Enable hostapd as a service
```
systemctl unmask hostapd
systemctl enable hostapd
```

You can test manually that the service will start this way with

```
systemctl start hostapd
```


## DHCP

### Install DHCP

```
apt-get install isc-dhcp-server

```

edit the file /etc/default/isc-dhcp-server and change the line of ipv4.
```

INTERFACESv4="wlan0"

```

edit the file /etc/dhcp/dhcpd.conf
```
option domain-name "example.com";
option domain-name-servers 1.1.1.1, 8.8.8.8;

default-lease-time 600;
max-lease-time 7200;

ddns-update-style none;

subnet 192.168.66.0 netmask 255.255.255.0 {
  range 192.168.66.2 192.168.66.20;
  option domain-name-servers 192.168.15.1, 1.1.1.1, 8.8.8.8;
  option routers 192.168.66.1;
}
```

## Using the internet traffic in wlan0 from eth0.


## OpenVPN                

