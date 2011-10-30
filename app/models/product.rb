class Product < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "400x500>", :thumb => "240x380>" }
  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :categories


  before_destroy :ensure_not_referenced_by_any_line_item

  #validates :title, :presence => true, :uniqueness => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

 # validates :title, :length => {:minimum => 3}

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
