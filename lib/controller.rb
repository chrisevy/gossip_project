
require 'gossip'

class ApplicationController < Sinatra::Base
   
    get '/' do
        erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new/' do
        erb :new_gossip
    end


    # je créé un gossip et je save dans le array gossip en même temps
	post '/gossips/new/' do
       Gossip.new(params["gossip_author"], params["gossip_content"]).save
       redirect '/'
    end

    # affiche un potin de manière unique via son id
    get '/gossips/:id' do
        erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
    end
    

      # permet d'éditer avec le formualaire edit.erb
    get '/gossips/:id/edit' do
        erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
    end  

end
