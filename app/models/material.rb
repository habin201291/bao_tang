class Material < ActiveRecord::Base
  has_many :artifacts, :dependent => :destroy
  attr_accessible :language, :name
  validates :language, :presence => true
  validates :name, :presence => true 
end
