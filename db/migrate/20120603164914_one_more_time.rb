class OneMoreTime < ActiveRecord::Migration
  def up
    drop_table :users

    create_table :users do |t|
      t.string :access_token
      t.string :name
      t.text :fb_info, :limit => nil
      t.text :fb_contacts, :limit => nil
      t.text :linkedin_info, :limit => nil
      t.text :linkedin_contacts, :limit => nil
      t.text :twitter_info, :limit => nil
      t.text :twitter_contacts, :limit => nil
      
      t.timestamps
    end
  end

  def down
  end
end
