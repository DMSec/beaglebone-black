# beaglebone-black
A repository with scripts, tools and programs to use with my beaglebone black


## Beaglebone black rev c

## access the beablebone with usb over internet

## Connect your usb dongle TL-WN722N to wifi network

sudo su


connmanctl scan wifi

connmanctl agents on

connmanctl services

connmanctl connect xxxxxxxxxxxx

connmanctl quit

### update and prepare the linux headers

apt update

apt upgrade -y

apt install linux-headers-$(uname -r)


### Install manually the driver wifi

git clone https://github.com/lwfinger/rtl8188eu.git

cd rtl8188eu

git checkout v5.2.2.4

echo "blacklist r8188eu" > /etc/modprobe.d/blacklist.conf

make all

make install

### disconnect from wifi now

```
connmanctl connect xxxxxxxxxxxx
```

### Enable type monitor to wifi adapter 

iwconfig wlan0 mode monitor

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



                

