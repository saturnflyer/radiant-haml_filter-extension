class HamlFilter < TextFilter
  #description_file File.dirname(__FILE__) + "/../textile.html"
  def filter(text)
    original_text = text
    
    begin
      Haml::Engine.new(text).render
    rescue Haml::SyntaxError
      original_text # Stop Nesting ;)
    end
  end
end
