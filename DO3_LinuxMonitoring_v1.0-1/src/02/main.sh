#!/bin/bash

sudo chmod +x ./data.sh

if [ $# -gt 0 ]
  then
    echo "Error: parameters are not needed"
else
  chmod +x data.sh
  ./data.sh
  read -p "Do you want to write information to a file?? (Y/N): " answer
  if [[ $answer == Y || $answer == y ]]
    then
      file="$(date +"%d_%B_%Y_%H_%M_%S").status"
      ./data.sh > $file
  fi
fi
