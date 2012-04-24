module Punchfork
  module Base

    def search(*args)
      Punchfork::Search.new(JSON.load(Net::HTTP.get_response(search_url(*args)).body))
    end
    
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