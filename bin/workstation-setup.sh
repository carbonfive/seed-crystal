#!/bin/sh

set -e

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
    echo "${RED}""Error: $*""${RESET}" >&2
}

warn() {
    echo "${YELLOW}""$*""${RESET}" >&2
}

announce() {
    echo "${BLUE}""$*""${RESET}" >&2
}

success() {
    echo "${GREEN}""$*""${RESET}" >&2
}
setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		RESET=""
	fi
}

setup_color

warn Caching root password...
sudo -K
sudo true;

command_exists brew || {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

announce Workstation setup...
brew update
brew bundle

announce Postgres...
createuser -s postgres

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

RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i '' 's/plugins=.*/plugins=(brew git rbenv gem rake bundler node npm heroku postgres redis-cli)/' ~/.zshrc

success All done.