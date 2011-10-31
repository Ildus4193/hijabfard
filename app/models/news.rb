class News < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "400x500>", :thumb => "110x117" }
end
