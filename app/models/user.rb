class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :login, :name, :last_name, :city, :email, :password, :password_confirmation, :remember_me
  validates :login, :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true
end
