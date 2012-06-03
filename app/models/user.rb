class User < ActiveRecord::Base
  has_and_belongs_to_many :events

  attr_accessible :access_token, :fb_contacts, :fb_info, :linkedin_contacts, :linkedin_info, :name, :twitter_contacts, :twitter_info
end
