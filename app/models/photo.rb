class Photo < ActiveRecord::Base
	include Paperclip::Glue
	belongs_to :artifact
    attr_accessible :artifact_id, :title,:avatar
    has_attached_file :avatar, :styles => { :medium => "600x600>", :thumb => "100x100#" }, :default_url => "/images/:style/"
    #validates_attachment_presence :avatar
    validates_attachment_size :avatar, :less_than => 5.megabytes
    validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
