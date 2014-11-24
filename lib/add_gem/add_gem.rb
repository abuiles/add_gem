require 'net/http'
require 'json'
module AddGem
  module AddGem
    extend self
    BASE_URL = "https://rubygems.org/api/v1/gems"

    def add(gem_name, options = {})
      url = "#{BASE_URL}/#{gem_name}.json"
      gem_info = get_gem(url)

      if gem_info
        group = !!options[:group] ? ", group: :#{options[:group]}" : ""
        gem_entry = %Q[gem "#{gem_name}", "~> #{gem_info["version"]}"#{group}]
        f = File.open('Gemfile', 'a+'){ |f| f.puts gem_entry }
        puts "Added #{gem_entry} to your Gemfile."
      else
        puts "Opps something went wrong fetching the gem information.\nTry curl #{url}"
      end
    end

    def get_gem(gem_url)
      uri = URI(gem_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = http.start do |h|
        h.request( Net::HTTP::Get.new(uri.request_uri) )
      end

      case response
      when Net::HTTPSuccess
        JSON.parse(response.body)
      else
        false
      end

    end
  end
end
