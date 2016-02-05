require 'player'

describe Player do
  subject(:sarah) { Player.new("sarah") }
  subject(:mic) { Player.new("mic") }

  describe '#name' do
    it "returns the player's name" do
      expect(sarah.name).to eq "sarah"
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(sarah.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#reduce_hit_points' do
    it "reduces hit points by 1" do
      expect{sarah.reduce_hit_points}.to change{sarah.hit_points}.by(-1)
    end
  end

end
