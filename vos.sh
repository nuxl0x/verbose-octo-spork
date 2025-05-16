#!/usr/bin/bash

# script variable statements
COMMAND="$1"
ARG_1="$2"
ARG_2="$3"
ARG_3="$4"
ARG_4="$5"

COMMANDS_DIRECTORY="/usr/local/share/vos/commands"
ASSETS_DIRECTORY="/usr/local/share/vos/assets"

# command functions (functions that are called upon determining the correct command)

function cmdlist {
    bash "$COMMANDS_DIRECTORY/cmdlist.sh"
}

function install_dependencies {
    bash "$COMMANDS_DIRECTORY/install_dependencies.sh"
}

function man {
    bash "$COMMANDS_DIRECTORY/man.sh" "$ARG_1"
}

function math {
    bash "$COMMANDS_DIRECTORY/math.sh" "$ARG_1" "$ARG_2" "$ARG_3" "$ARG_4"
}

function scan {
    bash "$COMMANDS_DIRECTORY/scan.sh" "$ARG_1" # potentially pending more arguments
}

function uninstall {
    bash "$COMMANDS_DIRECTORY/uninstall.sh"
}

function help {
    echo "[VOS] Usage: vos <command> [args...]"
    echo "[VOS] Run 'vos cmdlist' to view all commands."
}

case "$COMMAND" in
    cmdlist) cmdlist ;;
    install-dependencies) install_dependencies ;;
    man) man ;;
    math) math ;;
    scan) scan ;;
    uninstall) uninstall ;;
    ""|help) help ;;
    *)
        echo "[VOS] Error: Command '$COMMAND' not found."
        echo "[VOS] If you believe this to be an issue, report this error on Github."
        echo
        help
        exit 1
esac
