class HamlFilter < TextFilter
  #description_file File.dirname(__FILE__) + "/../textile.html"
  def filter(text)
    Haml::Engine.new(text).render
  end
end
