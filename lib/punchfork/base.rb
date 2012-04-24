module Punchfork
  module Base
    
    # Returns a Punchfork::Search object.  Accepts any number of arguments that will be used as ingredients in your search as well as an options hash.
    # Example: Punchfork.search(:tomatoes, :garlic, {count:5, protocol:'https'})
    def search(*args)
      Punchfork::Search.new(JSON.load(Net::HTTP.get_response(search_url(*args)).body))
    end
    
    # used by #search to query punchfork.com.  Returns a URI object.
    def search_url(*args)
      options = args.extract_options!.stringify_keys!
      protocol = (options['protocol'] || self.protocol).to_s
      
      uri = search_uri
      uri.scheme = protocol
      uri.query = ["key=#{api_key}", "q=#{URI.escape(args.join(','))}", *options.map{ |k,v| "#{k}=#{v}" }].join('&')
      return uri
    end
      
  end        
end