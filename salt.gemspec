# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "salt/version"

Gem::Specification.new do |s|
  s.name        = "salt"
  s.version     = Salt::VERSION
  s.authors     = ["Alexander Kern"]
  s.email       = ["alex@kernul.com"]
  s.homepage    = "https://github.com/CapnKernul/salt"
  s.summary     = %q{Create custom HTML tags}
  s.description = %q{A thin layer on top of Nokogiri for abstracting HTML elements}

  s.rubyforge_project = "salt"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "nokogiri"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard"
  s.add_development_dependency "rb-inotify"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "rb-fchange"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "growl_notify"
end
