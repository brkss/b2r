#!/bin/bash

arch=$(uname -a)
cpu_p=$(grep -c ^processor /proc/cpuinfo)
#cpu_v=$()
mem=$(free -t --mega | awk 'NR == 2 {printf("%d/%dMB : (%.2f%)"), $3, $2, $3/$2*100}')
dsk=$(df --total -h | awk 'END{printf("%s/%s (%s)", $3, $2, $5)}')

echo "#Architecture : $arch"
echo "#CPU physical : $cpu_p"
echo "#vCPU : $cpu_p"
echo "#Memory Usage : $mem"
echo "#Disk Usage : $dsk"
