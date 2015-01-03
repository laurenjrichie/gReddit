class CommentsController < ApplicationController
  before_action do
    @post = Post.find(params[:post_id])
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to @post, notice: "Your comment has been posted."
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
