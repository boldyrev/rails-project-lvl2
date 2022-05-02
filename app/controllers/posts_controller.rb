# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_url, notice: t('post.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.includes(:creator, :likes).find(params[:id])
    @comment = PostComment.new
    @comments = @post.comments.includes(:user).arrange
    @was_liked = @post.likes.find { |like| like.user_id == current_user&.id }.present?
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
