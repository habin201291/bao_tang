class Video < ActiveRecord::Base
	belongs_to :artifact
  attr_accessible :artifact_id, :description, :language, :title
end
