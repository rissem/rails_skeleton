class CreateUserEventMappingTable < ActiveRecord::Migration
  def up
    create_table :events_users do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end

  def down
  end
end
