#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

brew bundle --file=Brewfile.mobile

# shellcheck disable=SC2016
add_line_to_file 'export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'export ANDROID_HOME="$HOME/Library/Android/sdk"' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"' ~/.bash_profile
