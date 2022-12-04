class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :organizations, :string
    add_column :users, :user_type, :string
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
    add_index :users, :games
    add_index :users, :role
  end
end
