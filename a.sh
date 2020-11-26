#!/bin/bash
function repo_upd {
clear
sudo apt-get update && sudo apt-get upgrade -y
}
function ping_gog {
clear
ping -c 3 google.com
}
function  if_config {
clear
/sbin/ifconfig
}
function meminfo {
clear
#/bin/cat /proc/meminfo
free -h
}
function cpu_temp {
clear
temp=$(vcgencmd measure_temp | egrep -o '[0-79]*\.[0-9]*')
echo " CPU Temp = $temp *C"
}
function cpu_model {
clear
model=$(cat /proc/cpuinfo | grep Model)
echo " CPU $model"
}
#Creating menu
function menu {
clear
echo
echo -e "==========================================="
echo -e "                 Script Menu               "
echo -e "==========================================="
echo
echo -e "\t01) Repo update and upgrade"
echo -e "\t02) Google.com ping"
echo -e "\t03) Info about devices"
echo -e "\t04) Info about memory"
echo -e "\t05) CPU temp"
echo -e "\t06) CPU model"
echo -e "\t e) Exit"
echo 
echo -e "============================================"
echo -e "  Copyright (c) Evgenatrix 2020  "
echo -e "============================================"
echo
echo -en "Your choice: "
read -n 2 option
}
# Use While and Case, for Menu creating.
while [ $? -ne 1 ]
do
        menu
        case $option in
e)
        break ;;
01)	
	repo_upd ;;
02)
        ping_gog ;;
03)
        if_config ;;
04)
        meminfo ;;
05)
	cpu_temp ;;

06)
	cpu_model;;

*)
        clear
echo "Please select Menu variant! ";;
esac
echo -en "\n\n\t\t\tPress any key to continue!"
read -n 2 line
99
done
clear
