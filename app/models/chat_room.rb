# frozen_string_literal: true

# == Schema Information
#
# Table name: chat_rooms
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# fronze_string_literal: true

class ChatRoom < ApplicationRecord
  belongs_to :user
  with_options dependent: :destroy do |assoc|
    assoc.has_many :chat_room_users
    assoc.has_many :messages
    assoc.has_one_attached :photo
  end

  def to_s
    title.truncate(20)
  end
end
