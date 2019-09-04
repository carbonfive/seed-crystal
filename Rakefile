require "erb"

file "seed-workstation.sh" => [__FILE__, "seed-workstation.sh.erb"] do
    template = ERB.new(File.read("seed-workstation.sh.erb"))
    File.open("seed-workstation.sh", "w") { |f| f.write template.result(binding) }
end

task :test do
    sh "shellcheck seed-workstation.sh -e SC2039"
end