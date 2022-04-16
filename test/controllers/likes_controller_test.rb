# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @post_without_like = posts(:without_like)
    @like = post_likes(:one)

    sign_in @user
  end

  test 'should create post like' do
    post post_likes_path(@post_without_like)
    assert { @post_without_like.likes.find_by(user_id: @user.id) }
  end

  test 'should delete post like' do
    delete post_like_path(@post, @like)
    assert { !@post.likes.find_by(id: @like.id) }
  end
end
