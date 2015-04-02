class UsersController < ApplicationController
  require 'open-uri'
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @user = current_user
  end
end
