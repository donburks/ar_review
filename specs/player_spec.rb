require_relative 'spec_helper'

describe Player do
  describe 'associations' do
    it 'should be able to access its team' do
      t = Team.create name: "Testers", city: "Vancouver"
      p = t.players.create name: "Bob Bobberts", jersey: 1
      expect{p.team}.to_not raise_error
    end 
  end
  describe '.create' do
    it 'should not be valid without a name' do
      @player = Player.new
      expect(@player).to_not be_valid
    end

    it 'should not be valid without a jersey number' do
      @player = Player.create
      expect(@player.errors[:jersey]).to include("can't be blank")
    end

    it 'should require a number in the jersey field' do
      @player = Player.create jersey: "L"
      expect(@player.errors[:jersey]).to include("is not a number")
    end

    it 'should require an integer in the jersey field' do
      @player = Player.create jersey: "0.13"
      expect(@player.errors[:jersey]).to include("must be an integer")
    end

    it 'should require a jersey number higher than 23' do
      @player = Player.create jersey: 1
      expect(@player.errors[:jersey]).to include("must be greater than 23")
    end
  end

  describe '.create' do
    it 'should not be able to be created if the team is over capacity' do
      @team = Team.create name: "Dream Team", city: "Chicago"
      20.times do 
        @team.players.create name: "Player X", jersey: 40
      end

      @player = @team.players.create name: "No Team for You", jersey: 50

      #expect(@player).to_not be_valid
      expect(@player.errors[:capacity]).to include("team over capacity")
    end
  end
end
