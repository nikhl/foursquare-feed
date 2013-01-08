class SessionsController < ApplicationController

  skip_before_filter :authenticate, :only => [:new, :create]

  def new
    render :layout => false
  end

  def create
    auth              = request.env["omniauth.auth"]
    user              = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end