#!/bin/bash

timedatectl set-timezone Europe/Moscow

echo  HOSTNAME = $(hostname) #сетевое имя
echo  TIMEZONE = "$(timedatectl | grep zone | awk '{print $3,$4,"+"$5/(100)}'))" #временная зона, должна браться из системы и быть корректной для текущего местоположения
echo  USER = $(whoami) #текущий пользователь который запустил скрипт
echo  OS = $(cat /etc/issue | awk '{print $1$2}') #тип и версия операционной системы
echo  DATE = $(date | awk '{print $2" "$3" "$4" "$5}') #текущее время в виде: 12 May 2020 12:24:36
echo  UPTIME = "$(uptime -p)" #время работы системы
echo  UPTIME_SEC = $(awk '{print $1 " seconds"}' /proc/uptime)  #время работы системы в секундах
echo  IP = $(ip a | grep 'inet .*enp' | awk '{print $2}')  #ip-адрес машины в любом из сетевых интерфейсов
echo  MASK = $(netstat -rn | awk 'NR==4{print $3}')  #сетевая маска
echo  GATEWAY = $(ip -4 route show default | awk '{print $3}')  #ip шлюза по умолчанию
echo  RAM_TOTAL = $(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2/(1024*1024)}')  #размер оперативной памяти в Гб
echo  RAM_USED = $(vmstat -s | grep 'used memory' | awk '{printf "%.3f GB", $1/(1024*1024)}')  #размер используемой памяти в Гб
echo  RAM_FREE = $(vmstat -s | grep 'free memory' | awk '{printf "%.3f GB", $1/(1024*1024)}')  #размер свободной памяти в Гб
echo  SPACE_ROOT = $(df /root/ | grep dev | awk '{printf"%.2f MB", $2/1024}')  #размер рутового раздела в Mб
echo  SPACE_ROOT_USED = $(df /root/ | grep dev | awk '{printf"%.2f MB", $3/1024}')  #размер занятого пространства рутового раздела в Mб
echo  SPACE_ROOT_FREE = $(df /root/ | grep dev | awk '{printf"%.2f MB", $4/1024}')  #размер свободного пространства рутового раздела в Mб
