require "erb"

ViewData = Struct.new(:brewfile)

task :default => :test

file "seed-workstation.sh" => [__FILE__, "seed-workstation.sh.erb"] do
  view_data = ViewData.new
  view_data.brewfile = File.read("Brewfile")
  erb = ERB.new(File.read("seed-workstation.sh.erb"))
  File.open("seed-workstation.sh", "w") { |f| f.write erb.result(binding) }
end

task :test => "seed-workstation.sh" do
  sh "shellcheck seed-workstation.sh -e SC2039"
end