class Team < ActiveRecord::Base
  #SELECT * FROM players WHERE team_id=#{self.id};
  has_many :players, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5}
  validates :city, presence: true
end

