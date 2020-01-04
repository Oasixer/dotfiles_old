# Description
Just my linux dotfiles and other config

# Other
## How to set up eduroam on arch linux
* This was a huge pain in the ass so I'm putting instructions here for me or anyone else who needs them
* Install netctl
* cp ./eduroam/eduroam /etc/netctl/eduroam
* cp ./eduroam/wpa_supplicant_eduroam.conf /etc/wpa_supplicant_eduroam.conf
* Copy the output of the following:

ip route | grep '^default' | awk '{print $5}' | head -n1
* Edit /etc/wpa_supplicant_eduroam.conf
    * replace interface wlan0 with the copied inteface name
    * replace username and password
* sudo ip link set your_copied_interface_name down
* netctl start eduroam
