# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy mark_as_seen]
  before_action :authenticate_user!

  # GET /posts
  def index
    following_ids = current_user.following_ids
    posts = Post.unseen(following_ids, 13) # 13 => limit
    voted_ids = posts.includes(:votes_for).where(votes_for: { voter_id: current_user.id }).ids
    @posts = posts.map { |post| { voted: (voted_ids.include? post.id), post: post } }
  end

  # GET /posts/1
  def show
    @post = Post.includes(user: :profile_blob).find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    redirect_to current_user if @post.user_id != current_user.id
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    redirect_to @post and return if @post.save

    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /posts/1
  def update
    return if @post.user_id != current_user.id

    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    return unless @post.user_id == current_user.id

    @post.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
    end
  end

  # PATCH /posts/:id/seen
  def mark_as_seen
    SeenBy.create!(user_id: current_user.id, post_id: @post.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    post = params.require(:post)
    { content: post[:content], photos: post[:photos], photos_count: post[:photos].size }
  end
end
