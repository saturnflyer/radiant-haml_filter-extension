# dependencies are handled by bundler
require 'radiant-haml-filter-extension/version'

class HamlFilterExtension < Radiant::Extension
  version RadiantHamlFilterExtension::VERSION
  description "Allows Haml in templates."
  url "https://github.com/saturnflyer/radiant-haml_filter-extension"
  
  def activate
    HamlFilter
    Page.send :include, HamlTags
  end
  
end

