# frozen_string_literal: true

module UserConcern
  extend ActiveSupport::Concern

  included do
    enum GENDER = { female: 0, male: 1 }.freeze

    ## Validations
    validates :email, email: true
    validates :first_name, presence: true
    validates :username, uniqueness: true, if: :username_exists
    validates :gender, numericality: { only_integer: true }, inclusion: { in: GENDER.values }
  end

  ## callback
  def username_exists
    username.present?
  end

  ## Methods
  def to_s
    return "#{first_name} #{last_name}" if last_name.present?

    first_name
  end

  def follow(user)
    active_friendships.create!(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.destroy_by(followed_id: user.id)
  end

  def follows?(user)
    active_friendships.exists?(followed_id: user.id)
  end

  def online?
    !!(last_seen_at&.> 3.minutes.ago)
  end
end
