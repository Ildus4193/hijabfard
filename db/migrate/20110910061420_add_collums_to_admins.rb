class AddCollumsToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :city, :string
    add_column :admins, :adress, :string
    add_column :admins, :phone, :integer
  end

  def self.down
    remove_column :admins, :phone
    remove_column :admins, :adress
    remove_column :admins, :city
    remove_column :admins, :last_name
    remove_column :admins, :name
  end
end
