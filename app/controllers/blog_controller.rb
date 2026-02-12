class BlogController < ApplicationController
  allow_unauthenticated_access

  def index
    @posts = Post.published
  end

  def show
    @post = Post.friendly.find(params[:slug])
  end
end
