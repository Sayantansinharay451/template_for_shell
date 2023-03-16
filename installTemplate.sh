#! /bin/bash
#Purpose: It is the install script for Template.sh
#Version:1.0
#Created Date: Thu Mar 16 04:10:20 PM IST 2023
#Modified Date:
#Author: Sayantan Sinharay
# START #

installPackage() {
  local NEW_PATH=$1
  if [[ -f "${NEW_PATH}/template" ]]; then
    cat template.sh >template
  else
    echo "$(
      touch template
      cat template.sh >template
      chmod 777 template
      sudo mv template "${NEW_PATH}"
    )"
  fi
}
INSTALL_PATH="/bin/"

if [[ $# -eq 1 ]]; then
  INSTALL_PATH=$1
elif [[ $# -gt 1 ]]; then
  echo "ERROR: Expected 1 argument. Got $#"
  exit 1
fi

installPackage "${INSTALL_PATH}"
# touch hello.sh --> These are working
# chmod +x hello.sh -->
# END #
