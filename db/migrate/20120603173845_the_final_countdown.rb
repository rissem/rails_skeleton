class TheFinalCountdown < ActiveRecord::Migration
  def up
    change_column :users, :access_token, :text, :limit => nil    
    change_column :users, :name, :text, :limit => nil    
  end

  def down
  end
end
