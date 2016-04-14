class Team < ActiveRecord::Base
  has_many :players, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5}
  validates :city, presence: true
end
