require 'game'

describe Game do

  subject(:game) { described_class.new(player1, player2) }
  let(:player1) {double :player1, reduce_hit_points: true}
  let(:player2) {double :player2, reduce_hit_points: true}

  describe 'initialize' do

    it 'creates two players' do
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end

  end

  describe 'attack' do

    it 'calls reduce hit points on a player' do
      expect(player2).to receive(:reduce_hit_points)
      game.attack
      #why game.attack below expect?
    end

    it 'switches the player in control' do
      game.attack
      expect(game.player_in_control). to eq(player2)
    end
    
  end

end
