class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :address, :gender, :user_id
end
