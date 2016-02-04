require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
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
    player1 = Player.new(params[:name1])
    player2 = Player.new(params[:name2])
    $game = Game.new(player1, player2)
    redirect '/play'
  end
  #global variable used in above so can access elsewhere.

  get '/play' do
    @game = $game
    p @game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player2)
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
