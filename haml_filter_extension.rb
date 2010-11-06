# use rdiscount or bluecloth.
# haml supports more but these are preferred (subjective)
# cleaner to use a gem than to try and bundle markdowns bluecloth.

begin
  require 'bluecloth'
rescue LoadError
  begin
    require 'rdiscount'
  rescue LoadError
    puts "HAML Filter Extension requires bluecloth or rdiscount!"
  end
end

# and now the fun begins

class HamlFilterExtension < Radiant::Extension
  version "1.0"
  description "Allows you to construct pages using Haml"
  url "http://yourwebsite.com/haml_filter"
  
  def activate
    HamlFilter
    Page.send :include, HamlTags
  end
  
end

