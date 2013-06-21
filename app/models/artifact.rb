class Artifact < ActiveRecord::Base
  belongs_to :material
  attr_accessible :code, :dating, :description, :gallery_id, :language, :material_id, :name, :place, :size
end
