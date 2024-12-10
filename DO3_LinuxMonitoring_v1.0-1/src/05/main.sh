#!/bin/bash

export start_time=$(date +"%s")

if [[ $# -ne 1 ]]
  then
    echo "Please use one parameter"
else
  if ! [[ $1 == */ ]]
    then
      echo "The last symbol shold be '/'"
  elif ! [ -d $1 ]
    then
      echo "No directory"
  else
    export total_number_of_folders=$(sudo find $1 -type d | wc -l)
    export top_5_max_size_folders=$(du -c $1 | sort -rh | sed -n '1,5'p | awk '{print NR" - " $2 "/, " $1"K"}')
    export total_number_of_files=$(sudo find $1 -type f | wc -l)
    export configuration_files=$(sudo find $1 -type f -name "*.conf" | wc -l)
    export txt_files=$(sudo find $1 -type f -name "*.txt" | wc -l)
    export executable_files=$(sudo find $1 -type f -name "*.exe" | wc -l)
    export log_files=$(sudo find $1 -type f -name "*.log" | wc -l)
    export archive_files=$(sudo find $1 -type f | grep "\.(zip|rar|gz|tar|7z)" | wc -l)
    export symbolic_links=$(sudo find $1 -type l | wc -l)
    chmod +x data.sh
    ./data.sh
  fi
fi
  