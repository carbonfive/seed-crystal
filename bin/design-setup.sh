#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

add_line_to_file 'bin/design-setup.sh' ~/.seed-crystal/setup.sh

brew bundle --file=Brewfile.design
