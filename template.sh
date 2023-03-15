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

template() {
  echo -e "\nEnter the name of the file you want to create: \c"
  read -r file

  if [[ -z $file ]]; then
    force_exit
  else
    NEW_FILE=$(pwd)/$file.sh
  fi

  create_file NEW_FILE
}

create_file() {
  local file=$1
  if [[ -f $file.sh ]]; then
    echo -e "\nThe file already exists. Do you want to Overwrite it (y/n): \c"
    read -r choice
    if [[ $choice = "y" ]]; then
      create_file_template "$NEW_FILE"
      exit 0
    else
      echo -e "\nDo you want create file with a different name (y/n): \c"
      read -r choice
      if [[ $choice = "y" ]]; then
        template
      fi
      exit 1
    fi
  else
    create_file_template "$NEW_FILE"
    exit 0
  fi
}
# END #
