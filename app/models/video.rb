class Video < ActiveRecord::Base
  attr_accessible :artifact_id, :description, :language, :title
end
