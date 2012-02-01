$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "punchfork/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "punchfork"
  s.version     = Punchfork::VERSION
  s.authors     = ["Gabriel Odess-Gillett"]
  s.email       = ["gabeodess@gmail.com"]
  s.homepage    = "https://github.com/gabeodess/Punchfork"
  s.summary     = "A simple Ruby library for searching recipes with punchfork.com"
  s.description = "A simple Ruby library for searching recipes with punchfork.com"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"

  s.add_development_dependency "sqlite3"
end
