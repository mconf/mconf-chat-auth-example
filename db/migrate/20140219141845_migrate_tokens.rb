class MigrateTokens < ActiveRecord::Migration
  def change
    User.all.each do |user|
      params = { :token => user.chat_token, :application => user.chat_application }
      puts user.chat_tokens.create(params).inspect
    end
  end
end
