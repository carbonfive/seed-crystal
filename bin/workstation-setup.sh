#!/bin/sh

set -e

source "bin/library.sh"

setup_color

cache_root_password

command_exists brew || {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

announce Workstation setup...
brew update
brew bundle

# shellcheck disable=SC2016
add_line_to_file 'eval "$(rbenv init -)"' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'eval "$(nodenv init -)"' ~/.bash_profile

announce Postgres...
createuser -s postgres || true

announce Visual Studio Code extensions...
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

announce Hiding the dock...
defaults write com.apple.dock autohide -bool true
killall Dock

warn Application that need Security/Accessibility permissions...
open /Applications/KeepingYouAwake.app
open /Applications/Divvy.app
open /Applications/Flycut.app
open /Applications/Muzzle.app

announce Installing Oh My zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i '' 's/plugins=.*/plugins=(brew git rbenv gem rake bundler node npm heroku postgres redis-cli)/' ~/.zshrc

success All done.
warn You should probably reboot your machine to make sure that everything is set up.