# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  body          :text
#  user_id       :integer          not null
#  chat_rooms_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_rooms
end
