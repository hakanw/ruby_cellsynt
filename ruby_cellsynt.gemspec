$:.push File.expand_path("../lib", __FILE__)
require "ruby_cellsynt/version"

Gem::Specification.new do |s|
  s.name        = "ruby_cellsynt"
  s.version     = RubyCellsynt::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Håkan Waara"]
  s.email       = ["hwaara@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple gem to help out with Cellsynt SMS API}
  s.description = %q{A simple gem to help out with Cellsynt SMS API}

  s.add_runtime_dependency "launchy"
  s.add_development_dependency "rspec", "~>2.5.0"
  s.add_runtime_dependency "faraday", '~> 0.9.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
