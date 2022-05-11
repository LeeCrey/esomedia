# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :set_post, only: %i[index create destroy]
  before_action :authenticate_user!

  # GET /votes
  def index
    # @votes =
  end

  # POST /posts/:post_id/votes
  def create
    @post.upvote_by current_user
    render_partial_vote_btn true
  end

  # DELETE /posts/:post_id/votes
  def destroy
    @post.unvote_by current_user
    render_partial_vote_btn false
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  def render_partial_vote_btn(voted)
    render partial: "votes/vote", locals: { post: @post, voted: voted }
  end
end
