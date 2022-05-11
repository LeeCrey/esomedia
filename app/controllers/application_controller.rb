# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def update_last_seen_at
    if current_user
      current_user.touch :last_seen_at unless current_user.online?
    end
  end
end
