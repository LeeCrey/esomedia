# frozen_string_literal: true

# == Schema Information
#
# Table name: chat_room_users
#
#  id           :integer          not null, primary key
#  chat_room_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ChatRoomUser < ApplicationRecord
end
