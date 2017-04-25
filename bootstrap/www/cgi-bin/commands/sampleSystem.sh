#!/bin/sh

timestamp=$(date -Iseconds)
rxbytes=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
txbytes=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
cpu=$(cat /proc/stat | head -n 1)
cpuuser=$(echo $cpu | awk '{print $2}')
cpunice=$(echo $cpu | awk '{print $3}')
cpusystem=$(echo $cpu | awk '{print $4}')
cpuidle=$(echo $cpu | awk '{print $5}')

echo $timestamp $rxbytes $txbytes $cpuuser $cpunice $cpusystem $cpuidle >> /media/mmcblk0p2/data/samples