$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "require_params/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "require_params"
  s.version     = RequireParams::VERSION
  s.authors     = ["Yihang Ho"]
  s.email       = ["hoyihang5@gmail.com"]
  s.homepage    = "https://github.com/yihangho/require_params"
  s.summary     = "Ensure that all the parameters required by your actions are present."
  s.description = "require_params ensures that parameters that your Rails API actions require are present."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta2", "< 5.1"
end
