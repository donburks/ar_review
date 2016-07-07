class Player < ActiveRecord::Base
  # .all - SELECT * FROM players;
  # .find(#) - SELECT * FROM players WHERE id=#;
  # .find_by(key: value) - SELECT * FROM players WHERE field=value LIMIT 1;
  # .where(key: value) - SELECT * FROM players WHERE field=value;
  # .where("field operator value") - SELECT * FROM players WHERE field operator value;

  belongs_to :team

  validates :name, presence: true
  validates :jersey, presence: true, numericality: {only_integer: true, greater_than: 23}

  validate :test_team_capacity, if: :team

  private
    def test_team_capacity
      if team.players.count >= team.capacity
        errors.add(:capacity, "team over capacity")
      end
    end
end

