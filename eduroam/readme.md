# Setting up eduroam on non-ubuntu linux
* On ubuntu you can just use the built in gui for connecting
* This was a huge pain in the ass so I'm putting instructions here for me or anyone else who needs them
* I have only tested on arch linux but it should work on other distros. This may be helpful for rasperry pi, although you won't be able to ssh into it over eduroam anyway without getting it whitelisted by IT or something

## Why not just use a gui tool like nmtui
* I couldn't get nmtui to work

## Instructions
* Install netctl
* Run the following

cp ./eduroam/eduroam /etc/netctl/eduroam

cp ./eduroam/wpa_supplicant_eduroam.conf /etc/wpa_supplicant_eduroam.conf

* Copy the output of the following:

ip route | grep '^default' | awk '{print $5}' | head -n1

* Edit /etc/wpa_supplicant_eduroam.conf
    * replace interface wlan0 with the copied inteface name
    * replace username and password

* Run the following

sudo ip link set your_copied_interface_name down

netctl start eduroam
