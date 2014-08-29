Rails.application.routes.draw do
  scope :api do
    devise_for :users,
    :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks"
    }
    devise_scope :user do
      get '/current_user' => 'users/sessions#show_current_user'
      post '/check/is_user' => 'users/users#is_user', as: 'is_user'
    end
    resources :stocks, defaults: {format: :json} do
      get :ohlc
    end
    get :derivatives, to: 'derivatives#index'
  end
  get '/stockapp' => 'welcome#stockapp'
  root to: 'stockapp#index'
end
