#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

brew bundle --file=Brewfile.java

# https://www.mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/
# shellcheck disable=SC2016
add_line_to_file 'export JAVA_HOME=$(/usr/libexec/java_home)' ~/.bash_profile