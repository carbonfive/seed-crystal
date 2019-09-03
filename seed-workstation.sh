#!/bin/sh

# All-in-one workstation zero configuration setup

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew bundle --file=- <<EOT
tap "caskroom/cask"
tap "caskroom/versions"
tap "homebrew/services"

cask "docker"
cask "fork"
cask "ngrok"

brew "git"
brew "circleci"
brew "hub"
brew "node-build"
brew "nodenv"
brew "python"
brew "rbenv"
brew "ruby-build"
brew "yarn"

brew "postgres", restart_service: :changed
brew "redis", restart_service: :changed
EOT