#!/bin/bash
#Purpose: A simple script to give a template for your shell script
#Version: 1.0
#Created Date: Tue Mar 14 03:58:48 PM IST 2023
#Modified Date:
#Author: Sayantan Sinharay
# START #

#TODO: Add usage to the script

trap force_exit SIGINT SIGTSTP
trap cleanup EXIT

force_exit() {
  exit 1
  kill $$
}

cleanup() {
  local EXIT_STATUS=$?

  if [[ $EXIT_STATUS -eq 0 ]]; then
    echo -e "\nYour file has been created successfully!"
  else
    echo -e "\nNo file has been created!"
    force_exit
  fi
}

create_file_template() {
  local FILE=$1

  touch "$FILE"

  echo -e "#!/bin/bash \n#Purpose: \n#Version:1.0 \n#Created Date: $(date)\n#Modified Date: \n#Author: Sayantan Sinharay\n# START #\n\n\n\n# END #" >"$FILE"
}

echo -e "Enter the name of the file you want to create: \c"
read -r file

if [[ -z $file ]]; then
  force_exit
else
  NEW_FILE=$(pwd)/$file.sh
fi

if [[ -f $file.sh ]]; then
  echo -e "The file already exists. Do you want to Overwrite it (y/n): \c"
  read -r choice
else
  create_file_template "$NEW_FILE"
  exit 0
fi

if [[ $choice = "y" ]]; then
  create_file_template "$NEW_FILE"
  exit 0
else
  exit 1
fi

# END #
