class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :school, :string
    add_column :users, :age, :integer
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :area_code, :string
    add_column :users, :phone, :string
  end
end
