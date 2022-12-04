class ChangeUserType < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :user_type, false
  end
end
