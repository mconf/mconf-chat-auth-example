class AddChatApplicationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chat_application, :string, :null => true
  end
end
