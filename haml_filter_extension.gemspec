# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'radiant-haml-filter-extension/version'

Gem::Specification.new do |s|
  s.name        = 'radiant-haml_filter-extension'
  s.version     = RadiantHamlFilterExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Dan Higham', 'Jim Gay', 'Jordon Bedwell']
  s.email       = ['radiant@radiantcms.org']
  s.homepage    = 'http://radiantcms.org/'
  s.summary     = %q{Haml Filter for Radiant CMS}
  s.description = %q{Use Haml to create Radiant CMS pages and snippets.}

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split('\n').inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.require_paths = ['lib']
  
  # this is the same as in radiant
  s.add_dependency 'haml', '~> 3.1.1'
end
