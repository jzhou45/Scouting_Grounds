class EditUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :games
    add_index :users, :game
  end
end
