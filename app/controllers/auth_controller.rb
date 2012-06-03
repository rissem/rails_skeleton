require "httparty"

class AuthController < ApplicationController

  SINGLY_API_BASE = "https://api.singly.com"

  def callback
    auth = request.env["omniauth.auth"]
    session[:access_token] = auth.credentials.token
    find_and_save_stuff(auth.credentials.token)
    if request.user_agent =~ /Mobile|webOS/
      render :json => {:access_token => auth.credentials.token}
      return
    end
    redirect_to "/"
  end

  def find_and_save_stuff(access_token)
    #only do this for available services
    #get profiles, find user by access token
    
    user = User.where(:access_token => access_token).first
    user = User.new unless user
    user.access_token = access_token
    profiles = HTTParty.get(profiles_url, :query => {:access_token => access_token}).parsed_response
    # if profiles["facebook"] and not user.fb_info
    #   user.fb_info = HTTParty.get("#{SINGLY_API_BASE}/v0/services/facebook/self", :query => {:access_token => access_token}).parsed_response[0].to_json
    #   user.fb_contacts = HTTParty.get("#{SINGLY_API_BASE}/v0/services/facebook/friends", :query => {:access_token => access_token}).parsed_response.to_json
    # end

    # if profiles["twitter"] and not user.twitter_info
    #   user.twitter_info =  HTTParty.get("#{SINGLY_API_BASE}/v0/services/twitter/self", :query => {:access_token => access_token}).parsed_response[0].to_json
    #   user.twitter_contacts = HTTParty.get("#{SINGLY_API_BASE}/v0/services/twitter/friends", :query => {:access_token => access_token}).parsed_response.to_json
    # end

    # if profiles["linkedin"] and not user.linkedin_info
    #   user.linkedin_info = HTTParty.get("#{SINGLY_API_BASE}/v0/services/linkedin/self", :query => {:access_token => access_token}).parsed_response[0].to_json
    #   user.linkedin_contacts = HTTParty.get("#{SINGLY_API_BASE}/v0/services/linkedin/connectins", :query => {:access_token => access_token}).parsed_response.to_json
    # end
    user.save!
  end

  SINGLY_API_BASE = "https://api.singly.com"

  def profiles_url
    "#{SINGLY_API_BASE}/profiles"
  end

  def logout
    session.clear
    redirect_to "/"
  end
end
