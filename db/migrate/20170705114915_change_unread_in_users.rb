class ChangeUnreadInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :unread, :integer, default: 1
  end
end
