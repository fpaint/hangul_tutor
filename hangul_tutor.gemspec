$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hangul_tutor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hangul-tutor"
  s.version     = HangulTutor::VERSION
  s.authors     = ["andrew"]
  s.email       = ["fpaint@gmail.com"]
  s.homepage    = "http://hangul.weburn.ru"
  s.summary     = "Engine for hangul tutor page"
  s.description = "Simple app engine you can mount to"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails', "~> 5.1.2"  
  s.add_dependency 'haml'
  s.add_dependency 'sass-rails'
  s.add_dependency 'react-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'hangul', '0.1.0' #, git: 'https://github.com/aelaa/hangul.git'
  s.add_dependency 'sqlite3'

end

