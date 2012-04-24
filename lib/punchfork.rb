require 'net/http'

module Punchfork
  
  autoload :Configuration, 'punchfork/configuration'
  autoload :Base, 'punchfork/base'
  autoload :Search, 'punchfork/search'
  autoload :Recipe, 'punchfork/recipe'
  
  extend Configuration
  extend Base
  
  class << self
    
    def setup
      yield self
    end
    
  end
end
