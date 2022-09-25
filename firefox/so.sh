#!/bin/bash

check_match() {
	grep -qx -- "${1}" $2 
	exit_code=$?

	#echo $1
	#echo $2
	#echo $3
	#echo $exit_code
	

	if [ "$exit_code" == "0" ]; then
		echo "does match $3"
	else
		echo "does not match $3"
	fi
}

FILE_1=/home/mcm/projects/dotfiles/firefox/prefs.js
FILE_2=/home/mcm/.mozilla/firefox/6zpaipqa.mcm/prefs.js

last_line_file_1=$(tail -n 1 $FILE_1)
last_line_file_2=$(tail -n 1 $FILE_2)

check_match "$last_line_file_1" "$FILE_1" "file1 -> file1"
check_match "$last_line_file_2" "$FILE_2" "file2 -> file2"

check_match "$last_line_file_1" "$FILE_2" "file1 -> file2"
check_match "$last_line_file_2" "$FILE_1" "file2 -> file1"
	
if [ "$last_line_file_1" == "$last_line_file_2" ]; then 
	echo "they match"
else
	echo "they don't match"
fi

echo $last_line_file_1 > last_line_file_1.txt
echo $last_line_file_2 > last_line_file_2.txt

diff last_line_file_1.txt last_line_file_2.txt
