require 'game'

describe Game do

  subject(:game) { described_class.new(player1, player2) }
  let(:player1) {double :player1}
  let(:player2) {double :player2}

  describe 'player1' do
    it 'retrieves player 1' do
      p game
      expect(game.player1).to eq player1
  end

end

  it 'starts with player1' do
    expect(game.player1).to eq(player1)
  end

  it 'starts with player2' do
    expect(game.player2).to eq(player2)
  end

  describe 'attack' do
    it 'damages the player' do
      expect(player1).to receive(:receive_damage)
      game.attack(player1)
    end
  end

end
