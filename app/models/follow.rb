# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id          :integer          not null, primary key
#  follower_id :integer          not null
#  followed_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  counter_culture :follower, column_name: "followings_count", touch: true
  counter_culture :followed, column_name: "followers_count", touch: true

  validates :followed_id, :follower_id, presence: true
  # User should not follow himself/herself
  validates :follower_id, comparison: { other_than: :followed_id }
end
