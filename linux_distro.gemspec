Gem::Specification.new do |s|
    s.name        = "linux_distro"
    s.version     = "0.0.4"
    s.date        = "2012-03-09"
    s.summary     = "Linux Distribution"
    s.description = "Detects on which Linux distribution your code runs"
    s.authors     = ["Lukas Ocilka"]
    s.email       = "lukas.ocilka@suse.com"
    s.homepage    = "https://github.com/kobliha/linux_distro"
    s.files       = ["lib/linux_distro.rb"]
    s.license     = 'MIT'
    s.test_files  = Dir.glob('test/test_*.rb')
end
