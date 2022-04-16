# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    PostLike.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to post_path(params[:post_id])
  end

  def destroy
    PostLike.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end
end
