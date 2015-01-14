class UsersController < ApplicationController
	before_action :authenticate_user!   #add only: [:index] etc to block spcific pages from non loggedin users

	def index
		@users = User.all.order('created_at DESC')
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts			#nfor pagnation on posts
	end

	def following
	    @title = "Following"
	    @user  = User.find(params[:id])
	    @users = @user.following                       #.paginate(page: params[:page])
	    render 'show_follow'
	 end

	  def followers
	    @title = "Followers"
	    @user  = User.find(params[:id])
	    @users = @user.followers                      #.paginate(page: params[:page])
	    render 'show_follow'
	  end


end
