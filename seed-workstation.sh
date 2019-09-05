#!/bin/sh

# All-in-one workstation zero configuration setup

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew bundle --file=- <<EOT
tap "caskroom/versions"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/services"

# Enables you to reproduce the CircleCI environment locally
brew "circleci"
# Distributed revision control system
brew "git"
# Add GitHub support to git on the command-line
brew "hub"
# Command-line JSON pretty-printer
brew "jsonpp"
# Install NodeJS versions
brew "node-build"
# Manage multiple NodeJS versions
brew "nodenv"
# Object-relational database system
brew "postgresql", restart_service: :changed
# Interpreted, interactive, object-oriented programming language
brew "python"
# Install various Ruby versions and implementations
brew "ruby-build"
# Ruby version manager
brew "rbenv"
# Persistent key-value database, with built-in net interface
brew "redis", restart_service: :changed
# JavaScript package manager
brew "yarn"
# UNIX shell (command interpreter)
brew "zsh"
# Additional completion definitions for zsh
brew "zsh-completions"
# Yet Another Dotfiles Manager
brew "yadm"
# Add a public key to a remote machine's authorized_keys file
brew "ssh-copy-id"
# Executes a program periodically, showing output fullscreen
brew "watch"

# Docker Community Edition (app)
cask "docker"
# AdoptOpenJDK 8 -- Open source replace for Java8 (for Android)
cask "caskroom/versions/adoptopenjdk8"
# Prevents your Mac from going to sleep.
cask "keepingyouawake"
# Window manager
cask "divvy"
# Clipboard manager
cask "flycut"
# Chrome
cask "google-chrome"
# Firefox
cask "firefox"
# Atom
cask "atom"
# Visual Studio Code
cask "visual-studio-code"
# Silence notifications when screen sharing
cask "muzzle"
# Android IDE
cask "android-studio"
# Remind yourself to take a break
cask "time-out"
EOT

createuser -s postgres


/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension aaron-bond.better-comments

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension bajdzis.vscode-database

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension bung87.rails

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension bung87.vscode-gemfile

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension castwide.solargraph

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension christian-kohler.npm-intellisense

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension CoenraadS.bracket-pair-colorizer-2

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension donjayamanne.githistory

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension earshinov.permute-lines

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension eg2.vscode-npm-script

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension esbenp.prettier-vscode

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension formulahendry.auto-rename-tag

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension gurgeous.bust-a-gem

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension jpoissonnier.vscode-styled-components

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension juanartero.ruby-markers

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension kumar-harsh.graphql-for-vscode

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension leighlondon.eml

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension matthieumu.vscode-rubycommentdoc

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension mgmcdermott.vscode-language-babel

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension mikestead.dotenv

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ms-azuretools.vscode-docker

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ms-vsliveshare.vsliveshare

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension noku.rails-run-spec-vscode

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension pkosta2005.heroku-command

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension rebornix.ruby

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension Shan.code-settings-sync

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension sianglim.slim

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension sporto.rails-go-to-spec

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension sysoev.language-stylus

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension waderyan.gitblame

/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension xabikos.ReactSnippets


open /Applications/KeepingYouAwake.app
open /Applications/Divvy.app
open /Applications/Flycut.app
open /Applications/Muzzle.app

echo "Adding /usr/local/bin/zsh to /etc/shells"
grep -q /usr/local/bin/zsh /etc/shells || sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"

if [ "x$CIRCLECI" == "x" ]
then
  chsh -s /usr/local/bin/zsh
fi
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i '' 's/plugins=.*/plugins=(brew git rbenv gem rake bundler node npm heroku postgres redis-cli)/' ~/.zshrc
