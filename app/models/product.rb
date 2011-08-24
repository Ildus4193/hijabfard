class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  
  has_and_belongs_to_many :categories
  has_many :comments, :dependent => :destroy
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :title, :description, :image_url, :presence => true, :uniqueness => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  validates :title, :length => {:minimum => 3}
  
  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def rating
    line_items.sum(:quantity)
  end
 
  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
