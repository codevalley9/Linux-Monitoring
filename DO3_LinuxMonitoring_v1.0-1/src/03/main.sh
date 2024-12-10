#!/bin/bash
. ./data.sh
. ./colors.sh

function output {
  echo -e "${param1}${param2}HOSTNAME = ${param3}${param4}${HOSTNAME}${reset_color}"
  echo -e "${param1}${param2}TIMEZONE = ${param3}${param4}${TIMEZONE}${reset_color}"
  echo -e "${param1}${param2}USER = ${param3}${param4}${USER}${reset_color}"
  echo -e "${param1}${param2}OS = ${param3}${param4}${OS}${reset_color}"
  echo -e "${param1}${param2}DATE = ${param3}${param4}${DATE}${reset_color}"
  echo -e "${param1}${param2}UPTIME = ${param3}${param4}${UPTIME}${reset_color}"
  echo -e "${param1}${param2}UPTIME_SEC = ${param3}${param4}${UPTIME_SEC}${reset_color}"
  echo -e "${param1}${param2}IP = ${param3}${param4}${IP}${reset_color}"
  echo -e "${param1}${param2}MASK = ${param3}${param4}${MASK}${reset_color}"
  echo -e "${param1}${param2}GATEWAY = ${param3}${param4}${GATEWAY}${reset_color}"
  echo -e "${param1}${param2}RAM_TOTAL = ${param3}${param4}${RAM_TOTAL}${reset_color}"
  echo -e "${param1}${param2}RAM_USED = ${param3}${param4}${RAM_USED}${reset_color}"
  echo -e "${param1}${param2}RAM_FREE = ${param3}${param4}${RAM_FREE}${reset_color}"
  echo -e "${param1}${param2}SPACE_ROOT = ${param3}${param4}${SPACE_ROOT}${reset_color}"
  echo -e "${param1}${param2}SPACE_ROOT_USED = ${param3}${param4}${SPACE_ROOT_USED}${reset_color}"
  echo -e "${param1}${param2}SPACE_ROOT_FREE = ${param3}${param4}${SPACE_ROOT_FREE}${reset_color}"
}

if [[ $# -ne 4 ]]
  then
    echo "Please enter 4 parameters"
else
  color='([1-6]$)'
  if ! [[ $1 =~ $color && $2 =~ $color && $3 =~ $color && $4 =~ $color ]]
    then
      echo "You can use numbers from 1 to 6"
  elif [[ $1 == $2 || $3 == $4 ]]
    then
      echo "Error: 1st and 2nd or 3rd and 4th parameters cannot be equal. Please try again!"
  else
    case $1 in
    '1') param1=$white_back;;
    '2') param1=$red_back;;
    '3') param1=$green_back;;
    '4') param1=$blue_back;;
    '5') param1=$purple_back;;
    '6') param1=$black_back;;
esac

case $2 in
    '1') param2=$white_text;;
    '2') param2=$red_text;;
    '3') param2=$green_text;;
    '4') param2=$blue_text;;
    '5') param2=$purple_text;;
    '6') param2=$black_text;;
esac

case $3 in
    '1') param3=$white_back;;
    '2') param3=$red_back;;
    '3') param3=$green_back;;
    '4') param3=$blue_back;;
    '5') param3=$purple_back;;
    '6') param3=$black_back;;
esac

case $4 in
    '1') param4=$white_text;;
    '2') param4=$red_text;;
    '3') param4=$green_text;;
    '4') param4=$blue_text;;
    '5') param4=$purple_text;;
    '6') param4=$black_text;;
esac
    output
  fi
fi