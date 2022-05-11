# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[create destroy following follower]

  # POST /users/:user_id/follows
  def create
    current_user.follow @user
    render_partial_user
  end

  # DELETE /users/:user_id/follows
  def destroy
    current_user.unfollow @user
    render_partial_user
  end

  # GET /users/:user_id/followings
  def following
  end

  # GET /users/:user_id/followers
  def follower
    @users = @user.followers.limit(50)
  end

  ## private
  def find_user
    @user = User.find(params[:user_id])
  end

  def render_partial_user
    locals = { user: @user, follows: (action_name == "create") }
    render partial: "follows/follow", locals: locals
  end
end
