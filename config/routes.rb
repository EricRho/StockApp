Rails.application.routes.draw do
  devise_for :users
  scope :api do
    resources :stocks, defaults: {format: :json}
  end

  root 'stockapp#index'
end
