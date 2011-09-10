class AddPhoneTotalPriceToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :total_price, :decimal, :precision => 8, :scale => 2
    add_column :orders, :phone, :integer
  end

  def self.down
    remove_column :orders, :phone
    remove_column :orders, :total_price
  end
end
