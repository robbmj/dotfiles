#!/bin/bash

ORIGINAL_FILE=/home/mcm/projects/dotfiles/firefox/prefs.js
INSTALLED_FILE=/home/mcm/.mozilla/firefox/6zpaipqa.mcm/prefs.js

missing_prefs=()

while read -r line; do
	line=${line//\"/\\\"}
	grep -qx -- "${line}" $INSTALLED_FILE
	exit_code=$?
	if [ $exit_code != 0 ]; then
		missing_settings+=("${line}")
	fi

done < $ORIGINAL_FILE

for setting in "${missing_settings[@]}"; do
	echo $setting
done


ORIGINAL_FILE=/home/mcm/projects/dotfiles/firefox/prefs.js
INSTALLED_FILE=/home/mcm/.mozilla/firefox/6zpaipqa.mcm/prefs.js
line=$(tail -n 1 $ORIGINAL_FILE)
grep -x -- "${line}" $ORIGINAL_FILE
echo $? # 1

echo $line

