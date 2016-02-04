class Game

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @switch = true
  end

  def switcher
    @switch ^= true
  end

  def choose_attacking_player
    @player2.name if @switch == true
    @player1.name if @switcher == false
  end

  def defending_player
    @player2.receive_damage if @switch == false
    @player1.receive_damage if @switcher == true
  end

end
