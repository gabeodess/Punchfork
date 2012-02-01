module Punchfork
  module Configuration
    
    mattr_accessor :api_key
    @@api_key = ''
    
    mattr_reader :search_uri
    @@search_uri = URI.parse('http://api.punchfork.com/recipes')
    
  end
end