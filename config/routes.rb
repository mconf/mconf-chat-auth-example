MconfChatAuthExample::Application.routes.draw do
  root "welcome#index"
  devise_for :users

  get "chat-token" => "chat_tokens#show", as: "show_chat_token"
  post "chat-token/create" => "chat_tokens#create", as: "create_chat_token"
  post "chat-token/update" => "chat_tokens#update", as: "update_chat_token"
end
