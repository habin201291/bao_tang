class Audio < ActiveRecord::Base
  include Paperclip::Glue
  belongs_to :artifact
  attr_accessible :artifact_id, :title, :mp3
  has_attached_file :mp3
  validates_attachment_presence :mp3
  #validates_attachment_content_type :mp3, :content_type => [ 'audio/mp3' ]
end
