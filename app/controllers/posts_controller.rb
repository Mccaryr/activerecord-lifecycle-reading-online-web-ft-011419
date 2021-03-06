class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
		
		if @post.save
		redirect_to post_path(@post)
		
		else 
			redirect_to :new 
		end 
	end

	def update
		@post = Post.find(params[:id])
		
	  if @post.update(post_params)
		redirect_to post_path(@post)
		
		else 
			redirect_to :edit 
		end 
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :description)
	end 
end