#!/bin/sh

# A VERY minimal script to get things started

# Exit on error
set -e

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

error() {
    echo "${RED}""Error: $*""${RESET}" >&2
}

setup_color() {
    # Only use colors if connected to a terminal
    if [ -t 1 ]; then
        RED=$(printf '\033[31m')
        BLUE=$(printf '\033[34m')
        RESET=$(printf '\033[m')
    else
        RED=""
        BLUE=""
        RESET=""
    fi
}

# Prevent the cloned repository from having insecure permissions. Failing to do
# so causes compinit() calls to fail with "command not found: compdef" errors
# for users with insecure umasks (e.g., "002", allowing group writability). Note
# that this will be ignored under Cygwin by default, as Windows ACLs take
# precedence over umasks except for filesystems mounted with option "noacl".
umask g-w,o-w

echo "${BLUE}Cloning CaCO3...${RESET}"

command_exists git || {
    error "git is not installed"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install git
}

[ -d ~/Documents ] || mkdir -p ~/Documents

git clone --depth=1 https://github.com/carbonfive/seed-crystal.git ~/Documents/seed-crystal || {
    error "git clone of seed-crystal repo failed"
    exit 1
}

cd ~/Documents/seed-crystal

sh bin/workstation-setup.sh