class HamlFilter < TextFilter
  description_file File.dirname(__FILE__) + "/../haml.html"

  def filter(text)
    original_text = text
    
    begin
      # Attempt to parse HAML.
      Haml::Engine.new(text).render
    rescue Haml::SyntaxError => error
      # Probably nesting outside of Rails...
      "#{error.to_s} <br /> #{original_text}"
    end
  end
end
