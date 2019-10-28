#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

add_line_to_file 'bin/java-setup.sh' ~/.seed-crystal/setup.sh

add_line_to_file '# https://www.mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'export JAVA_HOME=$(/usr/libexec/java_home)' ~/.bash_profile

# Remove deprecated tap
brew untap caskroom/versions > /dev/null 2>&1 || true

caffeinate -i brew bundle --file=Brewfile.java
