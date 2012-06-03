class User < ActiveRecord::Base
  attr_accessible :access_token, :fb_contacts, :fb_info, :linkedin_contacts, :linkedin_info, :name, :twitter_contacts, :twitter_info
end
