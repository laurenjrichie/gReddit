class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    authenticate_user
    @post = Post.new
  end

  def create
    authenticate_user
    @post = current_user.posts.new(post_params)
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
    authenticate_user
    @post = current_user.posts.find_by(id: params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    authenticate_user
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
