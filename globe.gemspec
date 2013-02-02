$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "globe/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name			= "globe"
	s.version		= Globe::VERSION
	s.authors		= ["Tino"]
	s.email			= ["tino.zorotovic[add_monkey]gmail.com"]
	s.homepage	= "https://github.com/tzoro/globe"
	s.summary		= "TODO: Summary of Globe."
	s.description	= "TODO: Description of Globe."

	s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
	s.test_files = Dir["test/**/*"]

	s.add_dependency 'rails'
	#s.add_dependency 'activerecord'

	s.add_development_dependency 'pg'
end
