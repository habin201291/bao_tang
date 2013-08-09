class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  # attr_accessible :title, :body

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#", :small => "20x20#" }, :default_url => "/images/:style/"
  
  has_one :profile, :dependent => :destroy

  def timeout_in
  	1.day
  end
end
