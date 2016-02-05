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

end

  # def switcher
  #   @switch ^= true
  # end
  #
  # def choose_attacking_player
  #   @player2.name if @switch == true
  #   @player1.name if @switcher == false
  # end
  #
  # def defending_player
  #   @player2.receive_damage if @switch == false
  #   @player1.receive_damage if @switcher == true
  # end
