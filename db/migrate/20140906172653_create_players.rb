class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :franchise
      t.string :price
      t.integer :points
      t.string :role
      t.timestamps
    end
  end
end
