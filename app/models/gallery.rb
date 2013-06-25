class Gallery < ActiveRecord::Base
	has_many :artifacts
    attr_accessible :language, :name
end
