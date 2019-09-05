#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

brew bundle --file=Brewfile.mobile

add_line_to_file 'export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"' ~/.bash_profile
add_line_to_file 'export ANDROID_HOME="$HOME/Library/Android/sdk"' ~/.bash_profile
add_line_to_file 'export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home' ~/.bash_profile
add_line_to_file 'export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"' ~/.bash_profile