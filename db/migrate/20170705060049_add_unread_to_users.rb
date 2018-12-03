class AddUnreadToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :unread, :boolean, default: true
  end
end
