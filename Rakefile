require "erb"

ViewData = Struct.new(:vsc_extensions, :homebrew_packages, :mobile_packages)

task :default => :test

file "bin/workstation-setup.sh" => [__FILE__, "src/workstation-setup.sh.erb"] do |t|
  view_data = ViewData.new
  view_data.vsc_extensions = File.read("src/vsc_extensions.csv").split
  erb = ERB.new(File.read("src/workstation-setup.sh.erb"), $SAFE, "-")
  File.open(t.name, "w") { |f| f.write erb.result(binding) }
end

file "README.md" => [__FILE__, "src/README.md.erb", "Brewfile"] do |t|
  view_data = ViewData.new
  view_data.homebrew_packages = `grep '#- ' Brewfile | sed -e 's/^#//' | sort -fb`
  view_data.mobile_packages = `grep '#- ' Brewfile.mobile | sed -e 's/^#//' | sort -fb`
  erb = ERB.new(File.read("src/README.md.erb"), $SAFE, "-")
  File.open(t.name, "w") { |f| f.write erb.result(binding) }
end

task :test => ["bootstrap.sh", "bin/workstation-setup.sh", "README.md"] do |t|
  sh "shellcheck #{["bootstrap.sh", "bin/workstation-setup.sh"].join(' ')} -e SC2039"
end