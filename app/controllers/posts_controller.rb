class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post Added'
    else
      flash[:alert] = 'Post Failed'
      render :new
    end
  end

  protected
  def post_params
    params.require(:post).permit(:title, :author, :body)
  end

end
