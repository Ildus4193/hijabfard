class AddSizeToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :size, :integer
  end

  def self.down
    remove_column :line_items, :size
  end
end
