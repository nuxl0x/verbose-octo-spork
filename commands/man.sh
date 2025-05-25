#!/usr/bin/bash

ASSETS="/usr/local/share/vos/assets"
COMMAND="$1"

case "$COMMAND" in
  adventure-game) cat "$ASSETS/man_adventure_game.txt" ;;
  cmdlist) cat "$ASSETS/man_cmdlist.txt" ;;
  credits) cat "$ASSETS/man_credits.txt" ;;
  install-dependencies) cat "$ASSETS/man_install_dependencies.txt" ;;
  man) cat "$ASSETS/man_man.txt" ;;
  math) cat "$ASSETS/man_math.txt" ;;
  read) cat "$ASSETS/man_read.txt" ;;
  uninstall) cat "$ASSETS/man_uninstall.txt" ;;
  *) echo "[VOS] Unable to find manual page '$COMMAND'. If you believe this to be an error, contact the developer." ;;
esac
