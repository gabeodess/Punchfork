module Punchfork
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
    
  end
end