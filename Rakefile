require "erb"

ViewData = Struct.new(:vsc_extensions, :homebrew_packages)

task :default => :test

file "bin/workstation-setup.sh" => [__FILE__, "src/workstation-setup.sh.erb"] do |t|
  view_data = ViewData.new
  view_data.vsc_extensions = %w[
    aaron-bond.better-comments
    bajdzis.vscode-database
    bung87.rails
    bung87.vscode-gemfile
    castwide.solargraph
    christian-kohler.npm-intellisense
    CoenraadS.bracket-pair-colorizer-2
    donjayamanne.githistory
    earshinov.permute-lines
    eg2.vscode-npm-script
    esbenp.prettier-vscode
    formulahendry.auto-rename-tag
    gurgeous.bust-a-gem
    jpoissonnier.vscode-styled-components
    juanartero.ruby-markers
    kumar-harsh.graphql-for-vscode
    leighlondon.eml
    matthieumu.vscode-rubycommentdoc
    mgmcdermott.vscode-language-babel
    mikestead.dotenv
    ms-azuretools.vscode-docker
    ms-vsliveshare.vsliveshare
    noku.rails-run-spec-vscode
    pkosta2005.heroku-command
    rebornix.ruby
    Shan.code-settings-sync
    sianglim.slim
    sporto.rails-go-to-spec
    sysoev.language-stylus
    waderyan.gitblame
    xabikos.ReactSnippets
  ]
  erb = ERB.new(File.read("src/workstation-setup.sh.erb"), $SAFE, "-")
  File.open(t.name, "w") { |f| f.write erb.result(binding) }
end

file "README.md" => [__FILE__, "src/README.md.erb", "Brewfile"] do |t|
  view_data = ViewData.new
  view_data.homebrew_packages = `grep '#- ' Brewfile | sed -e 's/^#//' | sort -fb`
  erb = ERB.new(File.read("src/README.md.erb"), $SAFE, "-")
  File.open(t.name, "w") { |f| f.write erb.result(binding) }
end

task :test => ["bootstrap.sh", "bin/workstation-setup.sh"] do |t|
  sh "shellcheck #{t.prerequisites.join(' ')} -e SC2039"
end