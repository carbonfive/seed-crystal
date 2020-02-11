#!/bin/sh
# DO NOT EDIT THIS FILE
# AUTOMATICALLY GENERATED FROM workstation-setup.sh.erb
set -e

source "bin/library.sh"

setup_color

cache_root_password

add_line_to_file 'bin/eng-setup.sh' ~/.seed-crystal/setup.sh

# shellcheck disable=SC2016
add_line_to_file 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' ~/.bash_profile
# shellcheck disable=SC2016
add_line_to_file 'if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi' ~/.bash_profile

# shellcheck disable=SC2016
add_line_to_file 'install: --no-document --conservative' ~/.gemrc
# shellcheck disable=SC2016
add_line_to_file 'update: --no-document --conservative' ~/.gemrc

mkdir -p ~/.rbenv
add_line_to_file 'bundler' ~/.rbenv/default-gems

# Remove deprecated tap
brew untap caskroom/versions > /dev/null 2>&1 || true

caffeinate -i brew bundle --file=Brewfile.eng || true

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
