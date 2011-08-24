class RenameColumnToProducts < ActiveRecord::Migration
  def self.up
    rename_column :products, :decsription, :description
  end

  def self.down
    rename_column :products, :description, :decsription
  end
end
