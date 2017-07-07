require './config/environment'
require './app/models/giphy_model.rb'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post '/results' do
    # grab the users input from the params hash
    search_term = params[:search_term]
    # send the users input to our giphy_model.rb - also changed sample url above!
    url = format_api_url(search_term)
    # take the giphy response and send it to the results page
    # make sure gif_url is an instance variable with @ so that results.rb can access it
    @gif_url = call_giphy_api(url)
    # render the results page
    erb :results
  end
end
