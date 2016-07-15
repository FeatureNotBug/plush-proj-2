Rails.application.routes.draw do
  resources :requests
  get 'requests/new' => 'requests#new'

  devise_for :users
  root 'welcome#index'
  get 'welcome/browse'

  resources :users

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
