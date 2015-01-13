class UsersController < ApplicationController


	def index
		@users = User.all.order('created_at DESC')
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts			#nfor pagnation on posts
	end


end
