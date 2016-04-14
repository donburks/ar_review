class PlayerInfo < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.string :name
      t.integer :jersey
    end
  end
end
