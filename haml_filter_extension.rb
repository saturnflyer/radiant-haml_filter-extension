# Use rdiscount or bluecloth. Haml supports more but these are
# preferred (subjective) cleaner to use a gem than to try and
# bundle markdowns bluecloth.

begin
  require "bluecloth"
  # ^ Preferred still?
rescue LoadError
  begin
    require "rdiscount"
    # ^ Just incase....
  rescue LoadError
    STDERR.puts "Radiant Haml Extension requires markdown:"
    STDERR.puts "$user:~ sudo gem install bluecloth"
    raise LoadError, "Missing dependency: bluecloth or rdiscount."
  end
end

class HamlFilterExtension < Radiant::Extension
  version "1.1"
  description "Allows Haml in templates."
  url "https://github.com/saturnflyer/radiant-haml_filter-extension"
  
  def activate
    HamlFilter
    Page.send :include, HamlTags
  end
  
end

