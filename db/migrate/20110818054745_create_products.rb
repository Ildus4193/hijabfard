class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :decsription
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :size
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
