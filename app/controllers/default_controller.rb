require "httparty"

class DefaultController < ApplicationController
  def home
    if access_token
      @profiles = HTTParty.get(profiles_url,
        :query => {:access_token => access_token}
      ).parsed_response
    end
  end

  def facebook
    results = HTTParty.get("#{SINGLY_API_BASE}/v0/services/facebook/#{params[:api_method]}", :query => {:access_token => access_token}).parsed_response
    render :json => results
  end

  def twitter
    results = HTTParty.get("#{SINGLY_API_BASE}/v0/services/twitter/#{params[:api_method]}", :query => {:access_token => access_token}).parsed_response
    render :json => results    
  end

  def linkedin
    results = HTTParty.get("#{SINGLY_API_BASE}/v0/services/linkedin/#{params[:api_method]}", :query => {:access_token => access_token}).parsed_response
    render :json => results    
  end  

private

  def access_token
    session[:access_token]
  end

  SINGLY_API_BASE = "https://api.singly.com"

  def profiles_url
    "#{SINGLY_API_BASE}/profiles"
  end
end
