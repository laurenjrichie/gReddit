class CommentsController < ApplicationController
  before_action do
    @post = Post.find(params[:post_id])
  end

  def new
    # authenticate_user
    @comment = @post.comments.new
  end

  def create
    # authenticate_user
    @comment = @post.comments.new(comment_params)
    # @comment.user_id = current.user_id
    if @comment.save
      redirect_to @post, notice: "Your comment has been posted."
    else
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post, notice: "Comment was successfully deleted."
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
