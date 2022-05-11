# frozen_string_literal: true

# == Schema Information
#
# Table name: removed_users
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  removed_user_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class RemovedUser < ApplicationRecord
  belongs_to :removed_user, class_name: "User"

  # validations
  validates :user_id, :removed_user_id, presence: true
  ## user should not remove himself/herself
  validates :user_id, comparison: { other_than: :removed_user_id }
end
