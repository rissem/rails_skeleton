class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :name
      t.string :fb_info
      t.string :fb_contacts
      t.string :linkedin_info
      t.string :linkedin_contacts
      t.string :twitter_info
      t.string :twitter_contacts

      t.timestamps
    end
  end
end
