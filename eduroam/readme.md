# Setting up eduroam on linux without a desktop environment
* I have only tested on arch linux but it should work on other distros. This may be helpful for rasperry pi, although you won't be able to ssh into it over eduroam anyway without getting it whitelisted by IT or something

## Instructions
* Install netctl if needed (it ships with arch linux)
* Run the following

cp ./eduroam/eduroam /etc/netctl/eduroam

cp ./eduroam/wpa_supplicant_eduroam.conf /etc
cp ./eduroam/Waterloo_Eduroam_CA_CERT.pem /etc

* Copy the output of the following to get your wifi interface name:

ip route | grep '^default' | awk '{print $5}' | head -n1

* Edit /etc/wpa_supplicant_eduroam.conf
    * replace interface wlan0 with the copied inteface name
    * replace username and password

* Run the following

sudo ip link set your_copied_interface_name down

netctl start eduroam
