require 'net/http'

module Punchfork
  
  autoload :Configuration, 'punchfork/configuration'
  autoload :Base, 'punchfork/base'
  
  extend Configuration
  extend Base
  
  class << self
    
    def setup
      yield self
    end
    
  end
end
