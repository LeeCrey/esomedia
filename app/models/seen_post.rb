# frozen_string_literal: true

# == Schema Information
#
# Table name: seen_posts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SeenPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
