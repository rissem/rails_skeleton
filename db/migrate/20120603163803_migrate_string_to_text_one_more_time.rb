class MigrateStringToTextOneMoreTime < ActiveRecord::Migration
  def up
    drop_table :users

    create_table :users do |t|
      t.string :access_token
      t.string :name
      t.text :fb_info
      t.text :fb_contacts
      t.text :linkedin_info
      t.text :linkedin_contacts
      t.text :twitter_info
      t.text :twitter_contacts
      
      t.timestamps
    end
  end

  def down
  end
end
