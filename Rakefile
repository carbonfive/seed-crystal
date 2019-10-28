require "erb"

task :default => :test

task :build => ["bin/eng-setup.sh", "README.md"]

file "bin/eng-setup.sh" => [__FILE__, "src/eng-setup.sh.erb"] do |t|
  view_data = ViewData.new
  view_data.vsc_extensions = File.read("src/vsc_extensions.csv").split
  erb = ERB.new(File.read("src/eng-setup.sh.erb"), $SAFE, "-")
  File.open(t.name, "w") { |f| f.write erb.result(binding) }
  FileUtils.chmod("+x", t.name)
end

ViewData = Struct.new(:vsc_extensions, :core_packages, :mobile_packages, :design_packages, :web_packages, :java_packages, :eng_packages)

file "README.md" => [__FILE__, "src/README.md.erb", "Brewfile", *FileList["Brewfile.*"]] do |t|
  view_data = ViewData.new
  view_data.core_packages = `grep '#- ' Brewfile | sed -e 's/^#//' | sort -fb`
  view_data.mobile_packages = `grep '#- ' Brewfile.mobile | sed -e 's/^#//' | sort -fb`
  view_data.design_packages = `grep '#- ' Brewfile.design | sed -e 's/^#//' | sort -fb`
  view_data.web_packages = `grep '#- ' Brewfile.web | sed -e 's/^#//' | sort -fb`
  view_data.java_packages = `grep '#- ' Brewfile.java | sed -e 's/^#//' | sort -fb`
  view_data.eng_packages = `grep '#- ' Brewfile.eng | sed -e 's/^#//' | sort -fb`
  erb = ERB.new(File.read("src/README.md.erb"), $SAFE, "-")
  File.open(t.name, "w") { |f| f.write erb.result(binding) }
end

task :test => :build do |t|
  sh "shellcheck -x #{FileList["**/*.sh"].join(' ')} -e SC2039"
  sh "circleci config validate"
end
