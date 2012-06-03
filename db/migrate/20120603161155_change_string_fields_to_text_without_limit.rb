class ChangeStringFieldsToTextWithoutLimit < ActiveRecord::Migration
  def up
    change_column :users, :fb_contacts, :text, :limit => nil
    change_column :users, :fb_info, :text, :limit => nil
    change_column :users, :linkedin_contacts, :text, :limit => nil
    change_column :users, :linkedin_info, :text, :limit => nil
    change_column :users, :twitter_contacts, :text, :limit => nil
    change_column :users, :twitter_info, :text, :limit => nil
  end

  def down
  end
end
