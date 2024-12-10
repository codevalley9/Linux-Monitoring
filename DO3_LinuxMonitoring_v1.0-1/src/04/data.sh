#!/bin/bash

HOSTNAME="$(hostname)"
TIMEZONE="$(timedatectl | grep zone | awk '{print $3,$4,"+" ($5/(100))}'))"
USER=$(whoami)
OS="$(cat /etc/issue | awk '{print $1$2}')"
DATE="$(date | awk '{print $2" "$3" "$4" "$5}')"
UPTIME="$(uptime -p)"
UPTIME_SEC="$(awk '{print $1 " seconds"}' /proc/uptime)"
IP="$(ip a | grep 'inet .*enp' | awk '{print $2}')"
MASK="$(netstat -rn | awk 'NR==4{print $3}')"
GATEWAY="$(ip -4 route show default | awk '{print $3}')"
RAM_TOTAL="$(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2/(1024*1024)}')"
RAM_USED="$(vmstat -s | grep 'used memory' | awk '{printf "%.3f GB", $1/(1024*1024)}')"
RAM_FREE="$(vmstat -s | grep 'free memory' | awk '{printf "%.3f GB", $1/(1024*1024)}')"
SPACE_ROOT="$(df /root/ | grep dev | awk '{printf"%.2f MB", $2/1024}')"
SPACE_ROOT_USED="$(df /root/ | grep dev | awk '{printf"%.2f MB", $3/1024}')"
SPACE_ROOT_FREE="$(df /root/ | grep dev | awk '{printf"%.2f MB", $4/1024}')"