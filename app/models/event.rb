class Event < ActiveRecord::Base
  has_and_belongs_to_many :users

  attr_accessible :name, :time
end
