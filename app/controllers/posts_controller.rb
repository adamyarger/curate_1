class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]
	# for devise #if user not authorized they get redirected to the sign up page
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end
	
	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post Created!"   					# should flash a success message
			redirect_to root_url
		else
			render 'new'   #change to render home page if you want to not have a posts/new url
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def upvote
		@post.upvote_by current_user
		redirect_to :back
	end

	private
		# this is used by multiple methods
		def find_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:body)
		end
end
