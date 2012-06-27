Reviewomatic::Application.routes.draw do

  devise_for :users, :token_authentication_key => :access_token, :skip => [:sessions]
  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new', :as => :new_user_session
    post 'sign_in' => 'devise/sessions#create', :as => :user_session
    get 'sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root :to => 'dashboard#index'

end
