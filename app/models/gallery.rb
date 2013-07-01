class Gallery < ActiveRecord::Base
	has_many :artifacts
    attr_accessible :language, :name
    validates :language, :presence => true
    validates :name, :presence => true
end
