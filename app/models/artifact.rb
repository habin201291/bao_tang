class Artifact < ActiveRecord::Base
  belongs_to :material
  belongs_to :gallery
  has_many :audios
  has_many :videos
  has_many :photos
  attr_accessible :code, :dating, :description, :gallery_id, :language, :material_id, :name, :place, :size
end
