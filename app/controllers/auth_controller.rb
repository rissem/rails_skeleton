require "httparty"

class AuthController < ApplicationController

  SINGLY_API_BASE = "https://api.singly.com"

  def callback
    auth = request.env["omniauth.auth"]
    session[:access_token] = auth.credentials.token
    if request.user_agent =~ /Mobile|webOS/
      render :json => {:access_token => auth.credentials.token}
      return
    end
    redirect_to "/"
  end

  def logout
    session.clear
    redirect_to "/"
  end
end
