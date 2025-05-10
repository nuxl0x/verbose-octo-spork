#!/usr/bin/bash


function install {
    echo "Install."
}

function remove {
    echo "Remove."
}


INSTALL_DIR="$(dirname "$(realpath "$0")")"
echo "[VOS-INFO] configure.sh is running from: $INSTALL_DIR."

if [[ "$EUID" -ne 0 ]]; then
    echo "[VOS-ERROR] install.sh must be run with sudo, or as the root user."
    exit 1
fi

echo "[VOS-INFO] configure.sh is running successfully. Please wait."

read -p "[VOS-INPUT] What action would you like to perform? (Install, Remove.): " action
if [[ "$action" == "Install" ]]; then
    install
elif [[ "$action" == "Remove" ]]; then
    remove
else
    echo "[VOS-ERROR] You have entered an invalid prompt. Re-execute this file to try again."
fi
