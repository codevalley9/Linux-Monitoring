#!/bin/bash

echo "Total number of folders (including all nested ones) = $total_number_of_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$top_5_max_size_folders"
echo "Total number of files = $total_number_of_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $configuration_files"
echo "Text files = $txt_files"
echo "Executable files = $executable_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symbolic_links"
echo "TOP 10 files of maximum size and arranged in descending order (path, size and type):"

for (( i=1; i<11; i++))
do
  top_10_path=$(find $1 -type f -exec du -h {} + | sort -hr | head -$i | tail +$i |  awk '{print $2}')
  top_10_size=$(find $1 -type f -exec du -h {} + | sort -hr | head -$i | tail +$i  | awk '{print $1}')
  type="${top_10_path##*.}"
  echo "$i - ${top_10_path}, ${top_10_size}, ${type}"
done

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

for (( j=1; j<11; j++))
do
  top_10_exe=$(find $1 -type f -executable -exec du -h {} + | sort -hr | head -$j | tail +$j | awk '{print $2}')
  top_10_exe_size=$(find $1 -type f -executable -exec du -h {} + | sort -hr | head -$j | tail +$j | awk '{print $1}')
  if ! [[ -z $top_10_exe ]]
    then
      hash=$(md5sum $top_10_exe | awk '{print $1}')
      echo "$j - $top_10_exe, $top_10_exe_size, $hash"
  fi
done

end_time=$(date +"%s")
run_time=$(($end_time - $start_time))
echo "Script execution time (in seconds) = $run_time"