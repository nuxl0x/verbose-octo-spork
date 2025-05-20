#!/usr/bin/bash

function uninstall {
  rm -f "/usr/local/bin/vos"
  if [[ -e "/usr/local/bin/vos" ]]; then
    echo "[VOS-ERROR] Failed to detect successful deletion of /usr/local/bin/vos."
    exit 1
  fi
  echo "[VOS-INFO] /usr/local/bin/vos was successfully deleted."
  rm -rf "/usr/local/share/vos"
  if [[ -e "/usr/local/share/vos" ]]; then
    echo "[VOS-ERROR] Failed to detect successful deletion of /usr/local/share/vos."
    exit 1
  fi
  echo "[VOS-INFO] Uninstallation successful. Terminating..."
  exit 0
}

echo "[VOS-WARNING] This command will COMPLETELY delete VOS and all related files off of your computer."
read -p "[VOS-INPUT] Confirm that you wish to continue? (y/n): " uninstall_confirm
uninstall_confirm="${uninstall_confirm,,}"
if [[ "$uninstall_confirm" == "y" ]]; then
  uninstall
fi

echo "[VOS-ERROR] Uninstallation not confirmed. Exiting..."
exit 1
