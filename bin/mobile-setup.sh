#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

add_line_to_file 'bin/mobile-setup.sh' ~/.seed-crystal/setup.sh

# Remove deprecated tap
brew untap caskroom/versions > /dev/null 2>&1 || true

caffeinate -i brew bundle --file=Brewfile.mobile || true

# shellcheck disable=SC2016
add_line_to_file 'export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'export ANDROID_HOME="$HOME/Library/Android/sdk"' ~/.bash_profile
# https://www.mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/
# shellcheck disable=SC2016
add_line_to_file 'export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"' ~/.bash_profile
