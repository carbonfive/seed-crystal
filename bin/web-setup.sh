#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

add_line_to_file 'bin/web-setup.sh' ~/.seed-crystal/setup.sh

# Remove deprecated tap
brew untap caskroom/versions > /dev/null 2>&1 || true

caffeinate -i brew bundle --file=Brewfile.web || true
