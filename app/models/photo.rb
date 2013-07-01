class Photo < ActiveRecord::Base
	include Paperclip::Glue
	belongs_to :artifact
    attr_accessible :artifact_id, :title,:avatar
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/"
end
