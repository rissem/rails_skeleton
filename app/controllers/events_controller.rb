require "httparty"

class EventsController < ApplicationController
  def index
    render :json => Event.all
  end

  def people
    event = Event.find(params[:event_id])
    people = []
    event.users.each do |user|
      person = {}
      score = 0
      if user.fb_info
        score += 5
        fb_info = JSON.parse(user.fb_info)
        person[:name] = fb_info["data"]["name"]
        person[:picture] = "http://graph.facebook.com/#{fb_info['data']['id']}/picture"
      end
      if user.linkedin_info
        score += 5
        linkedin_info = JSON.parse(user.linkedin_info)
        score += linkedin_info["data"]["numConnections"].to_i / 10
        person[:name] = "#{linkedin_info['data']['firstName']} #{linkedin_info['data']['lastName']}" unless person[:name]
      end
      if user.twitter_info
        score += 5
        twitter_info = JSON.parse(user.twitter_info)
        puts "TWITTER BONUS #{twitter_info["data"]["followers_count"].to_i / 10}"
        score += twitter_info["data"]["followers_count"].to_i / 10
        person[:name] = twitter_info['data']['name']
      end
      person["score"] = score
      person["token"] = user.access_token
      people << person
    end
    render :json => people
  end
end
