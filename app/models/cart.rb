class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id, quantity, size)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += quantity.to_i
      current_item.size = size.to_i
    else
      current_item = line_items.build(:product_id => product_id, :quantity => quantity, :size => size)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    line_items.sum(:quantity)
  end



end
