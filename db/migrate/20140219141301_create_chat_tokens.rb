class CreateChatTokens < ActiveRecord::Migration
  def change
    create_table "chat_tokens", :force => true do |t|
      t.integer  "user_id"
      t.string   "token"
      t.string   "application"
      t.timestamps
    end
  end
end
