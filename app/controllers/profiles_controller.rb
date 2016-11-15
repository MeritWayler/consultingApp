class ProfilesController < ApplicationController
	def viewProfiles
	end 
	def index
		@users = User.all
	end
end
