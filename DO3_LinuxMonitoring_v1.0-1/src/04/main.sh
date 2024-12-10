#!/bin/bash
. ./data.sh
. ./colors.sh

function image {
  echo -e "${parametr_1}${parametr_2}HOSTNAME = ${parametr_3}${parametr_4}${HOSTNAME}${reset_color}"
  echo -e "${parametr_1}${parametr_2}TIMEZONE = ${parametr_3}${parametr_4}${TIMEZONE}${reset_color}"
  echo -e "${parametr_1}${parametr_2}USER = ${parametr_3}${parametr_4}${USER}${reset_color}"
  echo -e "${parametr_1}${parametr_2}OS = ${parametr_3}${parametr_4}${OS}${reset_color}"
  echo -e "${parametr_1}${parametr_2}DATE = ${parametr_3}${parametr_4}${DATE}${reset_color}"
  echo -e "${parametr_1}${parametr_2}UPTIME = ${parametr_3}${parametr_4}${UPTIME}${reset_color}"
  echo -e "${parametr_1}${parametr_2}UPTIME_SEC = ${parametr_3}${parametr_4}${UPTIME_SEC}${reset_color}"
  echo -e "${parametr_1}${parametr_2}IP = ${parametr_3}${parametr_4}${IP}${reset_color}"
  echo -e "${parametr_1}${parametr_2}MASK = ${parametr_3}${parametr_4}${MASK}${reset_color}"
  echo -e "${parametr_1}${parametr_2}GATEWAY = ${parametr_3}${parametr_4}${GATEWAY}${reset_color}"
  echo -e "${parametr_1}${parametr_2}RAM_TOTAL = ${parametr_3}${parametr_4}${RAM_TOTAL}${reset_color}"
  echo -e "${parametr_1}${parametr_2}RAM_USED = ${parametr_3}${parametr_4}${RAM_USED}${reset_color}"
  echo -e "${parametr_1}${parametr_2}RAM_FREE = ${parametr_3}${parametr_4}${RAM_FREE}${reset_color}"
  echo -e "${parametr_1}${parametr_2}SPACE_ROOT = ${parametr_3}${parametr_4}${SPACE_ROOT}${reset_color}"
  echo -e "${parametr_1}${parametr_2}SPACE_ROOT_USED = ${parametr_3}${parametr_4}${SPACE_ROOT_USED}${reset_color}"
  echo -e "${parametr_1}${parametr_2}SPACE_ROOT_FREE = ${parametr_3}${parametr_4}${SPACE_ROOT_FREE}${reset_color}"
}

function default_color {
  if [[ $column1_background == "" ]]
    then
      left_background=6; column1_background="default"
  fi
  if [[ $column1_font_color == "" ]]
    then
      left_text=3; column1_font_color="default"
  fi
  if [[ $column2_background == "" ]]
    then
      right_background=4; column2_background="default"
  fi
  if [[ $column2_font_color == "" ]]
    then
      right_text=3; column2_font_color="default"
  fi
}

if [ $# -ne 0 ]
  then
    echo "Please remove parameters and try again"
else
  source ./colors.sh
  source ./data.sh
  source ./parameters.conf
  left_background=$column1_background
  left_text=$column1_font_color
  right_background=$column2_background
  right_text=$column2_font_color
  default_color
  if [[ $left_background > 6 || $left_background < 1 || $left_text > 6 || $left_text < 1 || $right_background > 6 || $right_background < 1 || $right_text > 6 || $right_text < 1 ]]
    then
      echo "You can use numbers from 1 to 6"
  elif [[ $left_background -eq $left_text || $right_background -eq $right_text ]]
    then
      echo "Error: 1st and 2nd or 3rd and 4th parameters cannot be equal. Please try again!"
  else
    case $left_background in
      '1') parametr_1=$white_back; 1_back_color="white";;
      '2') parametr_1=$red_back; 1_back_color="red";;
      '3') parametr_1=$green_back; 1_back_color="green";;
      '4') parametr_1=$blue_back; 1_back_color="blue";;
      '5') parametr_1=$purple_back; 1_back_color="purple";;
      '6') parametr_1=$black_back; 1_back_color="black";;
    esac

    case $left_text in
      '1') parametr_2=$white_text; 1_text_color="white";;
      '2') parametr_2=$red_text; 1_text_color="red";;
      '3') parametr_2=$green_text; 1_text_color="green";;
      '4') parametr_2=$blue_text; 1_text_color="blue";;
      '5') parametr_2=$purple_text; 1_text_color="purple";;
      '6') parametr_2=$black_text; 1_text_color="black";;
    esac

    case $right_background in
      '1') parametr_3=$white_back; 2_back_color="white";;
      '2') parametr_3=$red_back; 2_back_color="red";;
      '3') parametr_3=$green_back; 2_back_color="green";;
      '4') parametr_3=$blue_back; 2_back_color="blue";;
      '5') parametr_3=$purple_back; 2_back_color="purple";;
      '6') parametr_3=$black_back; 2_back_color="black";;
    esac

    case $right_text in
      '1') parametr_4=$white_text; 2_text_color="white";;
      '2') parametr_4=$red_text; 2_text_color="red";;
      '3') parametr_4=$green_text; 2_text_color="green";;
      '4') parametr_4=$blue_text; 2_text_color="blue";;
      '5') parametr_4=$purple_text; 2_text_color="purple";;
      '6') parametr_4=$black_text; 2_text_color="black";;
    esac
    image
  fi
fi