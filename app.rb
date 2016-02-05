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
    player1 = (params[:name1])
    player2 = (params[:name2])
    $game = Game.new(Player.new(player1),Player.new(player2))
    redirect '/play'
  end
  #global variable used in above so can access elsewhere.

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    @player_waiting = $game.player_waiting
    @player_waiting.reduce_hit_points
    $game.switch_turn
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
