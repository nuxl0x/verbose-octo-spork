#!/usr/bin/bash

INSTALL_DIR="$(dirname "$(realpath "$0")")"
echo "[VOS-INFO] configure.sh is running from: $INSTALL_DIR."



function install {
    echo "[VOS-INFO] Installation Process Activated. Confirm that all required files (vos.sh & commands folder) are located in the same folder as configure.sh before continuing."
    read -p "[VOS-INPUT] Confirm that all required files are present in the same location as configure.sh? (y/n): " install_confirm
    if [[ "$install_confirm" -ne "y" ]]
        echo "[VOS-ERROR] User unable to confirm presence of installation files. Please put them in the correct location and answer 'y' to this prompt to install."
        exit 1
    fi
    echo "[VOS-INFO] Installation confirmed by user."

    if [[ ! -e "$INSTALL_DIR/vos.sh" ]]; then
        echo "[VOS-ERROR] File 'vos.sh' not detected within the same folder as 'configure.sh'. Please make sure that 'vos.sh' is in the correct folder."
        exit 1
    fi
    echo "[VOS-INFO] File 'vos.sh' detected successfully."

    if [[ ! -e "$INSTALL_DIR/commands" ]]; then
        echo "[VOS-ERROR] Folder 'commands' not detected within the same folder as 'configure.sh'. Please make sure that 'commands' is in the correct folder."
        exit 1
    fi
    echo "[VOS-INFO] Folder 'commands' detected successfully."
    
    echo "[VOS-INFO] After installation this file will be able to be located as a vos command. If you wish to uninstall, simply run 'vos uninstall' or run this script in uninstall mode."

    mv "$INSTALL_DIR/vos.sh" "$INSTALL_DIR/vos"
    echo "[VOS-INFO] vos.sh renamed to vos."

    chmod +x "$INSTALL_DIR/vos"
    echo "[VOS-INFO] vos given executable permissions."

    mv "$INSTALL_DIR/vos" "/usr/local/bin"
    echo "[VOS-INFO] vos moved into '/usr/local/bin'."

    if  [[ ! -e "/usr/local/bin/vos" ]]; then
        echo "[VOS-ERROR] Failed to detect successful installation of 'vos' / 'vos.sh' within /usr/local/bin. Please run this script in uninstall mode and try again. If this fails, report the issue on Github."
        exit 1
    fi

    mv "$INSTALL_DIR/commands" "/usr/local/bin/vos"
    echo "[VOS-INFO] commands moved into 'usr/local/bin/vos'."

    if  [[ ! -e "/usr/local/bin/vos/commands" ]]; then
        echo "[VOS-ERROR] Failed to detect successful installation of 'commands' within /usr/local/bin/vos. Please run this script in uninstall mode and try again. If this fails, report the issue on Github."
        exit 1
    fi

    echo "[VOS-INFO] Installation of VOS has successfully been accomplished."
    exit 0

}

function remove {
    read -p "[VOS-INPUT] Please confirm that you wish to uninstall VOS from your device. (y/n): " confirm_uninstall

    if [[ "$confirm_uninstall" -ne "y" ]]; then
        echo "[VOS-ERROR] Uninstall unconfirmed. Exiting."
        exit 1
    fi

    echo "[VOS-INFO] Uninstall confirmed. Uninstalling..."

    mv "usr/local/bin/vos/commands" "$INSTALL_DIR"
    mv "usr/local/bin/vos" "$INSTALL_DIR"
    mv "$INSTALL_DIR/vos" "$INSTALL_DIR/vos.sh"

    if [[ ! -e "$INSTALL_DIR/vos.sh" ]]; then
        echo "[VOS-ERROR] File 'vos.sh' not detected within the same folder as 'configure.sh'. There has been an error during uninstallation."
        exit 1
    fi
    echo "[VOS-INFO] File 'vos.sh' detected successfully."

    if [[ ! -e "$INSTALL_DIR/commands" ]]; then
        echo "[VOS-ERROR] Folder 'commands' not detected within the same folder as 'configure.sh'. There has been an error during uninstallation."
        exit 1
    fi
    echo "[VOS-INFO] Folder 'commands' detected successfully."

    echo "[VOS-INFO] Uninstallation has been completed!"
    exit 0
}



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
