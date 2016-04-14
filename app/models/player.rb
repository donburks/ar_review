class Player < ActiveRecord::Base
  belongs_to :team

  validates :name, presence: true
  validates :jersey, presence: true, numericality: {only_integer: true, greater_than: 23}
  #validate :test_team_capacity
  before_create :test_team_capacity, if: :team

  private
    def test_team_capacity
      errors.add(:capacity, "team over capacity") if validate_team_capacity
    end

    def validate_team_capacity
      team.players.length >= team.capacity
    end
end
