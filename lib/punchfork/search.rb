module Punchfork
  
  class Search
    
    def initialize(*args)
      @hash = args[0]
      @attributes = {}
      
      @hash.each do |k, v|
        instance_variable_set("@#{k}", v)
        self.class.class_eval{attr_reader k}
        @attributes[k] = v
      end
      
      @recipes = @recipes.map{ |recipe_hash| Recipe.new(recipe_hash) }
    end
    
    attr_reader :attributes
    
    def [](key)
      @hash[key]
    end
    
  end
  
  
end