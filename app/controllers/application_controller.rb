class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :authenticate

private

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  # Authenticate a user
  #
  # @return [undefined]
  #
  # @api private
  def authenticate
    not_authenticated unless authenticated?
  end
  
  # Test if the current user is authenticated
  #
  # @return [Boolean]
  #   returns true if the current user is authenticated
  #
  # @api private
  def authenticated?
    current_user?
  end
  
  # Display the login with Twitter when the user is not authenticated
  #
  # @return [undefined]
  #
  # @api private
  def not_authenticated
    redirect_to :controller => 'sessions', :action => 'new'
  end

  # Tests if the user exists
  #
  # @return [Boolean]
  #
  # @api private
  def current_user?
    if current_user
      true
    else
      false
    end
  end

end