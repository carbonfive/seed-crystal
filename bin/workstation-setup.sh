#!/bin/sh
set -e

source "bin/library.sh"

setup_color

cache_root_password

add_line_to_file 'bin/workstation-setup.sh' ~/.seed-crystal/setup.sh

announce Workstation setup...

add_line_to_file '/usr/local/bin/zsh' /etc/shells root

command_exists brew || {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

# Remove deprecated tap
brew untap caskroom/versions > /dev/null 2>&1 || true

caffeinate -i brew bundle --file=Brewfile.workstation || true

announce Hiding the dock...
defaults write com.apple.dock autohide -bool true
killall Dock

if [ "$CI" == "true" ]
then
  warn Some things can not be tested on CI
else
  echo brew cask install "logitech-control-center"
fi

announce Installing Oh My zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i '' 's/plugins=.*/plugins=(brew git rbenv gem rake bundler node npm heroku postgres redis-cli)/' ~/.zshrc

success All done.
warn You should probably reboot your machine to make sure that everything is set up.
