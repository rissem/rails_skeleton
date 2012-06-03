class AddSinglyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :singly_id, :string
  end
end
