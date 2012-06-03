class ChangeStringFieldsToText < ActiveRecord::Migration
  def up
    change_column :users, :fb_contacts, :text
    change_column :users, :fb_info, :text
    change_column :users, :linkedin_contacts, :text
    change_column :users, :linkedin_info, :text
    change_column :users, :twitter_contacts, :text
    change_column :users, :twitter_info, :text
  end

  def down
  end
end
