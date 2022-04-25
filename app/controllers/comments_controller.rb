# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = PostComment.new(post_comment_params)
    comment.post = post
    comment.user = current_user

    if comment.save
      redirect_to post, notice: t('comment.success')
    else
      redirect_to post_path(post), alert: comment.errors.full_messages.first
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
