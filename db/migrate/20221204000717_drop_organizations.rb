class DropOrganizations < ActiveRecord::Migration[7.0]
  def change
    drop_table :organizations
  end
end
