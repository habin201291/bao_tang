class Video < ActiveRecord::Base
	include Paperclip::Glue
	belongs_to :artifact
  attr_accessible :artifact_id, :description, :language, :title,:clip
    has_attached_file :clip
validates_attachment_presence :clip
validates_attachment_content_type :clip, :content_type => [ 'video/mp4','video/flv']
  
end
