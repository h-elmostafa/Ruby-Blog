class PostsController < ApplicationController
	before_action :find_post, only:[:show , :edit , :update ] 
  
  def index
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_Params)
  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end

  def show
  	
  end

  def edit
  	
  end

  def update

  	if @post.update(post_Params)
  		redirect_to @post
  	else
  		render	'edit'
  	end

  end

  def destroy
    asdasd
    @post = Post.find (params[:id])
    @post.destroy
    redirect_to root_path
    

  end
  
	private

	def find_post
		@post = Post.find (params[:id])
	end

	def post_Params
		params.require(:post).permit(:title, :body)
	end
end
