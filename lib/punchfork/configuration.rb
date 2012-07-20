module Punchfork
  module Configuration
    
    mattr_accessor :api_key, :protocol, :debug
    @@debug = ENV['PUNCHFORK_DEBUG']
    @@api_key = ENV['PUNCHFORK_API_KEY'] || ENV['KEY']
    @@protocol ||= ENV['PUNCHFORK_PROTOCOL'] || 'http'
    
    mattr_reader :search_uri
    @@search_uri = URI.parse('http://api.punchfork.com/recipes')
    
  end
end