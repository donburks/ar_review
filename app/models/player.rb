class Player < ActiveRecord::Base
  belongs_to :team

  validates :name, presence: true
  validates :jersey, presence: true, 
    numericality: {
      only_integer: true, 
      greater_than: 23
    }

  before_create :check_team_capacity, if: :team
  #validate :check_team_capacity

  private
    def check_team_capacity
      errors[:capacity] << "team over capacity" if team.players.count >= team.capacity
    end
end
