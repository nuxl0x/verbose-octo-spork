#!/usr/bin/bash

VERSION="2.0.0"
ZIP_FILE="vos-release-$VERSION.zip"

function download {
  curl -L -o "/home/$USER/Downloads/$ZIP_FILE" "https://github.com/nuxl0x/verbose-octo-spork/archive/refs/heads/release.zip"
  unzip "/home/$USER/Downloads/$ZIP_FILE" -d "/home/$USER/Downloads/vos-release-$VERSION"
}
                                                                                                                                                                              
# ----- Installation Function -----
function install {
    # Manual user confirmation
    echo "[VOS-INFO] Installation activated. Confirm that you wish to install before continuing."
    read -p "[VOS-INPUT] Confirm that you wish to install? (Y/N): " install_confirm
    install_confirm=${install_confirm,,}
    if [[ "$install_confirm" != "y" ]]; then
        echo "[VOS-ERROR] User unable to confirm installation. Answer 'y' to this prompt to install."
        exit 1
    fi
    echo "[VOS-INFO] Installation confirmed by user."

    download

    INSTALL_DIR="$HOME/Downloads/vos-release-$VERSION/verbose-octo-spork-release"
    echo "[VOS-INFO] install.sh is running in: $INSTALL_DIR."

    # Checks for required files to install
    if [[ ! -e "$INSTALL_DIR/vos.sh" ]]; then
        echo "[VOS-ERROR] File 'vos.sh' not detected within '$INSTALL_DIR'. Please make sure that 'vos.sh' is in the correct folder."
        exit 1
    fi
    echo "[VOS-INFO] File 'vos.sh' detected successfully."

    if [[ ! -e "$INSTALL_DIR/commands" ]]; then
        echo "[VOS-ERROR] Folder 'commands' not detected within '$INSTALL_DIR'. Please make sure that 'commands' is in the correct folder."
        exit 1
    fi
    echo "[VOS-INFO] Folder 'commands' detected successfully."

    if [[ ! -e "$INSTALL_DIR/assets" ]]; then
        echo "[VOS-ERROR] Folder 'assets' not detected within '$INSTALL_DIR'. Please make sure that 'assets' is in the correct folder."
        exit 1   
    fi
    echo "[VOS-INFO] Folder 'assets' detected successfully."
    
    echo "[VOS-INFO] After installation, if you wish to uninstall, simply run 'vos uninstall'."
    sleep 2

    # Renames vos.sh into vos (executable)
    sudo mv "$INSTALL_DIR/vos.sh" "$INSTALL_DIR/vos"
    echo "[VOS-INFO] vos.sh renamed to vos."

    sudo chmod +x "$INSTALL_DIR/vos"
    echo "[VOS-INFO] vos given executable permissions."

    # Removes old installs and puts new install in
    sudo rm -f "/usr/local/bin/vos"
    sudo mv "$INSTALL_DIR/vos" "/usr/local/bin"
    echo "[VOS-INFO] vos moved into '/usr/local/bin'."

    # Checks for new install
    if  [[ ! -e "/usr/local/bin/vos" ]]; then
        echo "[VOS-ERROR] Failed to detect successful installation of 'vos' / 'vos.sh' within /usr/local/bin. Please run this script in uninstall mode and try again. If this fails, report the issue on Github."
        exit 1
    fi

    # Removes old commands folder and creates vos share if it doesn't exist
    sudo rm -rf "/usr/local/share/vos"
    sudo mkdir -p "/usr/local/share/vos"
    # Puts new commands install in
    sudo mv "$INSTALL_DIR/commands" "/usr/local/share/vos"
    echo "[VOS-INFO] commands moved into '/usr/local/share/vos'."

    # checks for new commands install
    if  [[ ! -e "/usr/local/share/vos/commands" ]]; then
        echo "[VOS-ERROR] Failed to detect successful installation of 'commands' within /usr/local/share/vos. Please run this script in uninstall mode and try again. If this fails, report the issue on Github."
        exit 1
    fi

    sudo mv "$INSTALL_DIR/assets" "/usr/local/share/vos"
    echo "[VOS-INFO] assets moved into '/usr/local/share/vos'."

    # checks for new assets install
    if  [[ ! -e "/usr/local/share/vos/assets" ]]; then
        echo "[VOS-ERROR] Failed to detect successful installation of 'assets' within /usr/local/share/vos. Please run this script in uninstall mode and try again. If this fails, report the issue on Github."
        exit 1
    fi

    echo "[VOS-INFO] Installation of VOS has successfully been accomplished."
    exit 0

}

echo "[VOS-INFO] install.sh is running successfully. Please wait."
sleep 2
clear
# cool ascii logo
cat <<'EOF'
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
install
