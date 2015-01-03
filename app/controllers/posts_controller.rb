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
      redirect_to post_path(@post), notice: "Post was successfully created"
    else
      render :new  # what is :new?
    end
  end

  def show
    @post = Post.find(params[:id])  # when use post_id?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted"
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :content,
    )
  end

end
