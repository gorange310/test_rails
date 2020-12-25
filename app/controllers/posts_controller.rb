class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to "/"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated successfully."
      redirect_to "/"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was destroyed."
    redirect_to "/"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params["id"])
  end
end
