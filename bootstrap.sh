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

warn() {
    echo "${YELLOW}""Error: $*""${RESET}" >&2
}

announce() {
    echo "${BLUE}""Notice: $*""${RESET}" >&2
}

setup_color() {
    # Only use colors if connected to a terminal
    if [ -t 1 ]; then
        RED=$(printf '\033[31m')
        BLUE=$(printf '\033[34m')
        YELLOW=$(printf '\033[33m')
        RESET=$(printf '\033[m')
    else
        RED=""
        BLUE=""
        YELLOW=""
        RESET=""
    fi
}

setup_color

# Prevent the cloned repository from having insecure permissions. Failing to do
# so causes compinit() calls to fail with "command not found: compdef" errors
# for users with insecure umasks (e.g., "002", allowing group writability). Note
# that this will be ignored under Cygwin by default, as Windows ACLs take
# precedence over umasks except for filesystems mounted with option "noacl".
umask g-w,o-w

command_exists brew || {
    warn "homebrew is not installed (we need git)"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install git
}

# Remove deprecated tap
brew untap caskroom/versions || true

# shellcheck source=/dev/null
if [ -f ~/.seed-crystal/setup.sh ]; then
  announce "This workstation has already been seeded. Re-running setup scripts."
  cd ~/Documents/seed-crystal/
  announce "\n$(cat -n ~/.seed-crystal/setup.sh)"
  source ~/.seed-crystal/setup.sh
  exit
fi

[ -d ~/.seed-crystal ] || mkdir -p ~/.seed-crystal

[ -d ~/Documents ] || mkdir -p ~/Documents

if [ ! -d ~/Documents/seed-crystal ]
then
  announce "Cloning seed-crystal..."
  git clone --depth=1 https://github.com/carbonfive/seed-crystal.git ~/Documents/seed-crystal || {
      error "git clone of seed-crystal repo failed"
      exit 1
  }
fi

cd ~/Documents/seed-crystal

caffeinate -i "sh bin/workstation-setup.sh"
