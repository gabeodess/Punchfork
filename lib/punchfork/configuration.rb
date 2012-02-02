module Punchfork
  module Configuration
    
    mattr_accessor :api_key
    @@api_key = ENV['PUNCHFORK_API_KEY'] || ENV['KEY']
    
    mattr_reader :search_uri
    @@search_uri = URI.parse('http://api.punchfork.com/recipes')
    
  end
end