#!/bin/bash

arch=$(uname -a)
cpu_p=$(grep -c ^processor /proc/cpuinfo)
#cpu_v=$()
mem=$(free -t --mega | awk 'NR == 2 {printf("%d/%dMB : (%.2f%)"), $3, $2, $3/$2*100}')
dsk=$(df --total -h | awk 'END{printf("%s/%s (%s)", $3, $2, $5)}')
cpu_u=$(top -bn1 | grep load | awk '{printf "#CPU Load: %.2f%\n", $(NF-2)}')
last_boot=$(who -b | awk '{print $3" "$4}')
lvm=$(lsblk |grep lvm | awk '{if ($1) {print "yes";exit;} else {print "no"} }')
cn_tcp=$(netstat -an | grep ESTABLISHED |  wc -l)
user_log=$(who | cut -d " " -f 1 | sort -u | wc -l)
netw=$(hostname -I "(" ip a | grep link/ether | awk '{print $2}')
sudo_rc=$(hostname -I "(" ip a | grep link/ether | awk '{print $2}')

echo "#Architecture : $arch"
echo "#CPU physical : $cpu_p"
echo "#vCPU : $cpu_p"
echo "#Memory Usage : $mem"
echo "#Disk Usage : $dsk"
echo "#CPU load : $cpu_u"
echo "#Last boot : $last_boot"
echo "#LVM use : $lvm"
echo "#Connections TCP : $cn_tcp"
echo "#User log: $user_log"
echo "Network: $netw"
echo "Sudo: $sudo_rc"
