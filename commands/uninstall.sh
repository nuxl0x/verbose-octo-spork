#!/usr/bin/bash

function uninstall {
  rm "/usr/local/bin/vos"
  rm -rf "/usr/local/share/vos"
}

echo "[VOS-WARNING] This command will COMPLETELY delete VOS and all related files off of your computer."
read -p "[VOS-INPUT] Confirm that you wish to continue? (y/n): " uninstall_confirm
uninstall_confirm=${$uninstall_confirm,,}
if [[ "$uninstall_confirm" == "y" ]]; then
  uninstall
fi

echo "[VOS-ERROR] Uninstallation not confirmed. Exiting..."
exit 1
