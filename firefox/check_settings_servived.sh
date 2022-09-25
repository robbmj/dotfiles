#!/bin/bash


if [ "$1" == "" ] || [ "$1" == "-h" ]; then
	echo "Usage ./check_settings_servived.sh path to firefox profile dir"
	echo "usualy something like ~/.mozilla/firefox/<some_hash>"
	exit 1
fi

ORIGINAL_FILE="./prefs.js"
INSTALLED_FILE=$1/prefs.js

if [ ! -e $INSTALLED_FILE ]; then
	echo "prefs.js was not found in $1"
	exit 2
fi

if [ ! -r $INSTALLED_FILE ]; then
	echo "$INSTALLED_FILE is not readable"
	exit 3
fi

missing_settings=()


echo $INSTALLED_FILE

while read -r line; do
	# the lines have quotation marks in them, replace each instance of " with \"
	#escaped_line=${line//\"\\\"}

	grep -qx -- "${line}" $INSTALLED_FILE
	exit_code=$?
	
	#echo $exit_code

	if [ $exit_code != 0 ]; then
		#echo $line
		missing_settings+=("${line}")
	fi

done < $ORIGINAL_FILE

missing_count="${#missing_settings[@]}"

if [ $missing_count == 0 ]; then 
	exit 0
fi

ORIGINAL_N_SETTINGS=$(wc -l $ORIGINAL_FILE)
echo "Of the original $ORIGINAL_N_SETTINGS settings $missing_count were not found in $INSTALLED_FILE! Would you like to print them [Y/n]"

read ans < /dev/tty
if [ "$ans" != "Y" ] && [ "$ans" != "y" ]; then 
	exit 0
fi

for setting in "${missing_settings[@]}"; do
	echo $setting
done
