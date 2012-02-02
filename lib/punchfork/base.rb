module Punchfork
  module Base

    def search(*args)
      options = args.extract_options!
      search_uri.query = ["key=#{api_key}", "q=#{URI.escape(args.join(','))}", *options.map{ |k,v| "#{k}=#{v}" }].join('&')
      JSON.load(Net::HTTP.get_response(search_uri).body)
    end
      
  end
        
end