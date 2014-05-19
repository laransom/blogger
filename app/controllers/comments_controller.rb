class CommentsController < ApplicationController
  respond_to :html, :json

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.html do
          redirect_to @post, notice: 'Comment Added'
        end

        format.json do
          render json: @comment
        end
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = 'Comment Unsuccessful'
          render post_path(@post)
        end

        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end

  protected
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
