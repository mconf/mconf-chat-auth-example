MconfChatAuthExample::Application.routes.draw do
  root "welcome#index"
  devise_for :users

  get "chat-token" => "chat_tokens#show", as: "show_chat_token"
  post "chat-token/create" => "chat_tokens#create", as: "create_chat_token"
  post "chat-token/randomize" => "chat_tokens#randomize", as: "randomize_chat_token"
  delete "chat-token/destroy" => "chat_tokens#destroy", as: "destroy_chat_token"
end
