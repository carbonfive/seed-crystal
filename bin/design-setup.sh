#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

brew bundle --file=Brewfile.design
