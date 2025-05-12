#!/usr/bin/bash

INSTALL_DIR="$(dirname "$(realpath "$0")")"
echo "[VOS-INFO] configure.sh is running from: $INSTALL_DIR."
                                                                                                                                                                               


function install {
    echo "[VOS-INFO] Installation Process Activated. Confirm that all required files (vos.sh & commands folder) are located in the same folder as configure.sh before continuing."
    read -p "[VOS-INPUT] Confirm that all required files are present in the same location as configure.sh? (y/n): " install_confirm
    if [[ "$install_confirm" != "y" ]]; then
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
    
    echo "[VOS-INFO] After installation, if you wish to uninstall, simply run 'vos uninstall' or run this script in uninstall mode."

    mv "$INSTALL_DIR/vos.sh" "$INSTALL_DIR/vos"
    echo "[VOS-INFO] vos.sh renamed to vos."

    chmod +x "$INSTALL_DIR/vos"
    echo "[VOS-INFO] vos given executable permissions."

    rm -f /usr/local/bin/vos
    mv "$INSTALL_DIR/vos" "/usr/local/bin"
    echo "[VOS-INFO] vos moved into '/usr/local/bin'."

    if  [[ ! -e "/usr/local/bin/vos" ]]; then
        echo "[VOS-ERROR] Failed to detect successful installation of 'vos' / 'vos.sh' within /usr/local/bin. Please run this script in uninstall mode and try again. If this fails, report the issue on Github."
        exit 1
    fi

    rm -rf /usr/local/share/vos/commands
    mkdir -p /usr/local/share/vos
    mv "$INSTALL_DIR/commands" "/usr/local/share/vos"
    echo "[VOS-INFO] commands moved into '/usr/local/share/vos'."

    if  [[ ! -e "/usr/local/share/vos/commands" ]]; then
        echo "[VOS-ERROR] Failed to detect successful installation of 'commands' within /usr/local/share/vos. Please run this script in uninstall mode and try again. If this fails, report the issue on Github."
        exit 1
    fi

    echo "[VOS-INFO] Installation of VOS has successfully been accomplished."
    exit 0

}

function remove {
    read -p "[VOS-INPUT] Please confirm that you wish to uninstall VOS from your device. (y/n): " confirm_uninstall

    if [[ "$confirm_uninstall" != "y" ]]; then
        echo "[VOS-ERROR] Uninstall unconfirmed. Exiting."
        exit 1
    fi

    echo "[VOS-INFO] Uninstall confirmed. Uninstalling..."

    mv "/usr/local/share/vos/commands" "$INSTALL_DIR"
    mv "/usr/local/bin/vos" "$INSTALL_DIR"

    if [[ ! -e "$INSTALL_DIR/vos" ]]; then
        echo "[VOS-ERROR] Failed to detect 'vos' in '$INSTALL_DIR'."
    fi

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



if [[ "$EUID" != 0 ]]; then
    echo "[VOS-ERROR] install.sh must be run with sudo, or as the root user."
    exit 1
fi

echo "[VOS-INFO] configure.sh is running successfully. Please wait."
sleep 2
clear
cat <<EOF
 ,ggg,         ,gg    _,gggggg,_            ,gg,   
dP""Y8a       ,8P   ,d8P""d8P"Y8b,         i8""8i  
Yb, `88       d8'  ,d8'   Y8   "8b,dP      `8,,8'  
 `"  88       88   d8'    `Ybaaad88P'       `88'   
     88       88   8P       `""""Y8         dP"8,  
     I8       8I   8b            d8        dP' `8a 
     `8,     ,8'   Y8,          ,8P       dP'   `Yb
      Y8,   ,8P    `Y8,        ,8P'   _ ,dP'     I8
       Yb,_,dP      `Y8b,,__,,d8P'    "888,,____,dP
        "Y8P"         `"Y8888P"'      a8P"Y88888P" 

==========================================================

EOF
read -p "[VOS-INPUT] What action would you like to perform? (Install, Remove.): " action

action="${action,,}"
if [[ "$action" == "install" ]]; then
    install
elif [[ "$action" == "remove" ]]; then
    remove
else
    echo "[VOS-ERROR] You have entered an invalid action. Please enter 'Install' or 'Remove' in order to perform an action."
    exit 1
fi
