require 'game'
require 'player'

describe Game do

  subject(:game) { described_class.new(player1, player2) }
  let(:player1) {double :player1, hit_points: 10, reduce_hit_points: true}
  let(:player2) {double :player2, hit_points: 10, reduce_hit_points: true}
  let(:dead_player) {double :deadplayer, hit_points: 0}

  describe 'initialize' do

    it 'creates two players' do
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end

  end

  describe 'attack' do

    it 'switches the player in control' do
      player2.reduce_hit_points
      expect(game.player_in_control).to eq(player1)
    end

  end

  describe '#game over?' do
    subject(:game2) { described_class.new(player1, dead_player) }

    it 'returns true when hit points equals 0' do
        expect(game2.game_over?).to eq true
    end

  end

end
