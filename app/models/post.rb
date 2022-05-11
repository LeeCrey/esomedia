# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                       :integer          not null, primary key
#  content                  :text             not null
#  user_id                  :integer          not null
#  who_can_see              :integer          default(0), not null
#  can_commentable          :boolean          default(TRUE), not null
#  comments_count           :integer          default(0), not null
#  votes_count              :integer          default(0), not null
#  photos_attachments_count :integer          default(0), not null
#  last_edited_at           :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Post < ApplicationRecord
  ## Associations
  belongs_to :user
  has_many_attached :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  acts_as_votable

  counter_culture :user, touch: true

  ## Validations
  #### Either content or photos should be available
  validates :content, presence: true, unless: -> { photos.attached? }

  ## posts unseen by user. He/she should be follower
  scope :unseen, ->(user_ids, limit) do
          query_ = "LEFT OUTER JOIN seen_posts ON seen_posts.post_id = posts.id"
          includes(user: { profile_attachment: :blob }).where(user_id: user_ids)
          .joins(query_).where(seen_posts: { user_id: nil }).group(:user_id).limit(limit)
        end

  # Methods
  def to_s
    content.truncate(500)
  end
end
