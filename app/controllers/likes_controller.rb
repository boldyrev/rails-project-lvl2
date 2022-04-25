# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    return if PostLike.find_by(user_id: current_user.id, post_id: params[:post_id])

    PostLike.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to post_path(params[:post_id])
  end

  def destroy
    like = PostLike.find_by(user_id: current_user.id, post_id: params[:post_id])
    like&.destroy

    redirect_to post_path(params[:post_id])
  end
end
