#!/usr/bin/bash

ASSETS="/usr/local/share/vos/assets"
COMMAND="$1"

case "$COMMAND" in
  cmdlist) cat "$ASSETS/man_cmdlist.txt" ;;
  install-dependencies) cat "$ASSETS/man_install_dependencies.txt" ;;
  man) cat "$ASSETS/man_man.txt" ;;
  math) cat "$ASSETS/man_math.txt" ;;
  uninstall) cat "$ASSETS/man_uninstall.txt" ;;
esac
