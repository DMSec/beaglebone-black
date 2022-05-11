# beaglebone-black
A repository with scripts, tools and programs to use with my beaglebone black

## Setup wifi

* 1 - Make a change in the file `/etc/wpa.conf`
  
      sudo nano /etc/wpa.conf
    
     * Change the file with your network    
    
      network={
          ssid="TheSSID"
          proto=RSN
          key_mgmt=WPA-PSK
          pairwise=CCMP TKIP
          group=CCMP TKIP
          psk="ThePassword"}

* 2 - Run the file `.scripts/setupWifi-USB-TL-WN722N.sh`

    



                

