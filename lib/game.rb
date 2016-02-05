require './lib/player'

class Game

 attr_reader :player1, :player2, :player_in_control, :player_waiting

 def initialize(player1, player2)
   @player1 = player1
   @player2 = player2
   @player_in_control = player1
   @player_waiting = player2
 end

 # def attack
 #   @player_waiting.reduce_hit_points
 #   switch_turn
 # end

  def switch_turn
    if @player_in_control == player1
      @player_in_control, @player_waiting = player2, player1
    else
      @player_in_control, @player_waiting = player1, player2
    end
  end

  def game_over?
    # true
   player1.hit_points==0 || player2.hit_points == 0
  end

end
