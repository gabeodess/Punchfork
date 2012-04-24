module Punchfork
  
  # Wrapper for recipe search results.  Provides dot syntax support.
  class Recipe
    
    def initialize(*args)
      @hash = args[0]
      @attributes = {}
      @hash.each do |k, v|
        instance_variable_set("@#{k}", v)
        self.class.class_eval{attr_reader k}
        @attributes[k] = v
      end
    end
    
    attr_reader :attributes
    
    def secure_thumb
      return secure_url(thumb)
    end
    
    def secure_url(url)
      return url if url.match(/^https/)
      uri = URI.parse(url).tap{ |uri| uri.scheme = 'https'; uri.path = File.join('/', uri.host, uri.path); uri.host = 's3.amazonaws.com' }
      return uri.to_s
    end
    
  end
end