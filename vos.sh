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
function adventure_game {
    python3 "$COMMANDS_DIRECTORY/adventure_game.py"
}

function cmdlist {
    bash "$COMMANDS_DIRECTORY/cmdlist.sh"
}

function credits {
    bash "$COMMANDS_DIRECTORY/credits.sh"
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

function read {
    # arg 1 is the file to read from
    bash "$COMMANDS_DIRECTORY/read.sh" "$ARG_1"
}

function uninstall {
    bash "$COMMANDS_DIRECTORY/uninstall.sh"
}

function help {
    echo "[VOS] Usage: vos <command> [args...]"
    echo "[VOS] Run 'vos cmdlist' to view all commands."
}

case "$COMMAND" in
    adventure-game) adventure_game ;;
    cmdlist) cmdlist ;;
    credits) credits ;;
    install-dependencies) install_dependencies ;;
    man) man ;;
    math) math ;;
    read) read ;;
    uninstall) uninstall ;;
    ""|help) help ;;
    *)
        echo "[VOS] Error: Command '$COMMAND' not found."
        echo "[VOS] If you believe this to be an issue, report this error on Github."
        echo
        help
        exit 1
esac
