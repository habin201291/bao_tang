class Photo < ActiveRecord::Base
	belongs_to :artifact
  attr_accessible :artifact_id, :title
end
