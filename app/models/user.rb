class User < ActiveRecord::Base
	has_many :forums
	has_many :comments
end
