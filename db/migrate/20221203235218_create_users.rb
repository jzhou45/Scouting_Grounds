class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender
      t.string :game
      t.string :ign
      t.string :role
      t.string :mains
      t.timestamps
    end
  end
end
