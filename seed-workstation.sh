#!/bin/sh

# All-in-one workstation zero configuration setup

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew bundle