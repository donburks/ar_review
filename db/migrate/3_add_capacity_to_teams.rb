class AddCapacityToTeams < ActiveRecord::Migration
  def change
    change_table :teams do |t|
      t.integer :capacity, default: 20
    end
  end
end
