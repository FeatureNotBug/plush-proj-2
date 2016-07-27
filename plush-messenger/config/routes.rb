Rails.application.routes.draw do
  resources :requests
  resources :abouts

  get 'requests/new' => 'requests#new'

  # this may be removed later if I can't make it work
  resources :messages, only: [:new, :create]
  post '/messages/send_message', :to => "messages#send_message", :as => "send_message"

  devise_for :users
  root 'welcome#index'
  get 'welcome/browse'
  get 'users/edit_profile'

  resources :users

  post '/rate' => 'rater#create', :as => 'rate'

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations, only: [:index, :show, :destroy]
=begin
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
=end

end
