class ApplicationController < ActionController::Base
  # Create a method called current_user in your ApplicationController to make current user data available to all controllers
  def current_user
    User.first
  end
end
