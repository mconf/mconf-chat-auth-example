class RemoveChatColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :chat_application
    remove_column :users, :chat_token
  end
end
