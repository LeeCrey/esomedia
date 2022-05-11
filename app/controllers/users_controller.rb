# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  before_action :authenticate_user!

  # GET /users
  def index
    following_ids = current_user.following_ids
    exclude_users = following_ids.including(current_user.id)
    if turbo_frame_request?
      @users = User.not_following(4, exclude_users)
      render partial: "users/recommend", locals: { users: @users }
    end
    @users = User.not_following(exclude_users)
  end

  # GET /users/1
  def show
    @user = User.where(id: params[:id])&.first
    return root_url unless @user

    posts = @user.posts.includes(:user, photos_attachments: :blob).limit(10)
    voted_posts_ids = posts.includes(:votes_for).where(votes_for: { voter_id: current_user.id }).ids
    @posts = posts.map { |post| { voted: (voted_posts_ids.include? post.id), post: post } }
  end

  def remove
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
