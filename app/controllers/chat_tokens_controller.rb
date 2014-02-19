class ChatTokensController < ApplicationController
  before_filter :authenticate_user!

  def show
    if params[:token]
      token = current_user.chat_tokens.where(application: params[:application])
      @token_taken = !token.empty?
    end
  end

  def create
    if params[:token]
      values = { token: params[:token], application: params[:application] }
      token = current_user.chat_tokens.where(application: params[:application])
      if token.empty?
        current_user.chat_tokens.create(values)
      else
        token.first.update_attributes(values)
      end
    end
    redirect_to show_chat_token_path
  end

  def randomize
    token = ChatToken.find(params[:id])
    token.update_attributes(token: SecureRandom.hex(8))
    redirect_to show_chat_token_path
  end

  def destroy
    ChatToken.find(params[:id]).destroy
    redirect_to show_chat_token_path
  end
end
