require_relative 'spec_helper'

describe Team do
  describe 'associations' do
    it 'should be able to access its players' do
      t = Team.create name: "Testers", city: "Vancouver"
      expect{t.players}.to_not raise_error
    end 
  end

  describe 'validations' do
    it 'should not be valid without a name' do
      @team = Team.create
      expect(@team.errors[:name]).to include("can't be blank")
    end

    it 'should not be valid with a short name' do
      @team = Team.create name: "foo"
      expect(@team.errors[:name]).to include("is too short (minimum is 5 characters)")
    end

    it 'should be valid with a name greater than 5 characters' do
      @team = Team.create name: "Spec Wreckers"
      expect(@team.errors[:name]).to eq([])
    end

    it 'should not be valid without a city' do
      @team = Team.create
      expect(@team.errors[:city]).to include("can't be blank")
    end

    it 'should be valid with a name longer than 5 characters and a city' do
      @team = Team.create name: "Spec Wreckers", city: "Vancouver"
      expect(@team).to be_valid
    end
  end
  
  describe '#destroy' do
    it 'should destroy its players when the team bus goes off a cliff' do
      @team = Team.create name: "Teamerinos", city: "Vancouver"
      @team.players.create name: "Player", jersey: 10
      @team.destroy
      expect(Player.count).to eq(0)
    end
  end

  describe '#capacity' do
    it 'should have a default capacity of 20 players' do
      @team = Team.create name: "Team Full", city: "Vancouver"
      expect(@team.capacity).to eq(20)
    end
  end
end
