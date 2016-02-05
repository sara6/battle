require 'sinatra/base'
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
    $game = Game.new(Player.new(params[:name1]),Player.new(params[:name2]))
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    if $game.game_over?
      redirect '/game_over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @player_waiting = $game.player_waiting
    p @player_waiting
    @player_waiting.reduce_hit_points
    $game.switch_turn
    erb(:attack)
  end

  get '/game_over' do
    erb(:game_over)
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
