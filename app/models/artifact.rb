class Artifact < ActiveRecord::Base
  belongs_to :material
  belongs_to :gallery
  has_many :audios, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  attr_accessible :code, :dating, :description, :gallery_id, :language, :material_id, :name, :place, :size
  validates :code, :presence => true
  validates :language, :presence => true
  validates :name, :presence => true

  #searchable do
  	#text :name, :code, :language, :description
  #end
end
