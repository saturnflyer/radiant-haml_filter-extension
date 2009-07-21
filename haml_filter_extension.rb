# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class HamlFilterExtension < Radiant::Extension
  version "1.0"
  description "Allows you to construct pages using Haml"
  url "http://yourwebsite.com/haml_filter"
  
  def activate
    HamlFilter
    Page.send :include, HamlTags
  end
  
end
