# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string           not null
#  last_name              :string
#  username               :string
#  birthdate              :date             not null
#  gender                 :integer          not null
#  country                :string           not null
#  hometown               :string
#  current_city           :string
#  last_seen_at           :datetime
#  biography              :string
#  followings_count       :integer          default(0), not null
#  followers_count        :integer          default(0), not null
#  posts_count            :integer          default(0), not null
#  comments_count         :integer          default(0), not null
#  blocked_users_count    :integer          default(0), not null
#  verified               :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Associations
  with_options dependent: :destroy do |association|
    association.has_many :active_friendships, class_name: "Follow", foreign_key: :follower_id
    association.has_many :passive_friendships, class_name: "Follow", foreign_key: :followed_id
    association.has_many :posts, -> { order(id: :desc) }
    association.has_one_attached :profile
    association.has_one_attached :cover_picture
  end

  ### I don't want to destroy
  # has_many :seen_posts
  has_many :chat_rooms
  has_many :chat_room_users, through: :chat_rooms
  has_many :messages

  has_many :followings, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  acts_as_voter

  include UserConcern

  ## Scopes
  scope :not_following, ->(limit = 20, exclude_ids) do
          with_attached_profile.where.not(id: exclude_ids).limit(limit)
        end

  scope :male, -> { where(gender: User::GENDER[:male]) }
  scope :female, -> { where(gender: User::GENDER[:female]) }
end

## validations, callbacks, and methods are in models/concerns/user_concern.rb
## This file includes only [scopes and associations]
