class AddUsers < ActiveRecord::Migration
  def change
    create_table "users", :force => true do |t|
      t.string   "username"
      t.string   "email", null: false, default: ""
      t.string   "name"
      t.string   "chat_token"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
