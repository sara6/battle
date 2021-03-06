require 'sinatra/base'
require './lib/player'
#the above loads the sinatra lib.
#the below enables class Battle to load sinatra into the class and therefore
#use 'get' and 'post' etc.
class Battle < Sinatra::Base

  enable :sessions
  #above creates hash

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:name1])
    $player2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @name1 = $player1.name
    @name2 = $player2.name
    @HP1 = $player1.hit_points
    @HP2 = $player2.hit_points
    erb(:play)
  end

  get '/attack' do
    @player1 = $player1
    @player2 = $player2
    @player1.attack(@player2)
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
