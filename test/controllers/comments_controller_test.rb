# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @comment = post_comments(:one)
    sign_in @user
  end

  test 'should create comment' do
    post post_comments_path(@post), params: { post_comment: { content: @comment.content } }

    created_comment = PostComment.find_by(
      content: @comment.content,
      user: @user,
      post: @post
    )

    assert { created_comment }
    assert_redirected_to post_path(@post)
  end
end
