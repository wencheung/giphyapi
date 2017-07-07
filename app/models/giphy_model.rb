require 'net/http'  # two gems that must be included for any API
require 'json'

def format_api_url(search_term)
    api_key="00dce5e1aed249d29488d9243efb12c0"
    endpoint = "http://api.giphy.com/v1/gifs/search?q=#{search_term}&api_key=#{api_key}"
end

def call_giphy_api(url)
    # include all the gems needed to use APIs in ruby
    
    # open an access point to grab data
    uri = URI(url)  # this establishes an address to go grab the data with Ruby
    data = Net::HTTP.get(uri)  # goes to actually get the data
    # convert the data to a ruby hash
    formatted_data = JSON.parse(data)
    
    puts formatted_data
    
    result = formatted_data["data"].sample["images"]["fixed_height"]["url"]
    result
    # find the right url
    # return the giphy url
end
