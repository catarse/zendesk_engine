$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zendesk_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zendesk_engine"
  s.version     = ZendeskEngine::VERSION
  s.authors     = ["Diogo Biazus"]
  s.email       = ["diogo@biazus.me"]
  s.homepage    = "https://github.com/catarse/zendesk_engine"
  s.summary     = "This engine provides a controller to create tickets through zendesk API"
  s.description = "This engine provides a controller to create tickets through zendesk API"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.1.4", "< 6.1.0"
  s.add_dependency "zendesk_api"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
