MconfChatAuthExample::Application.routes.draw do
  root "welcome#index"
  devise_for :users
end
