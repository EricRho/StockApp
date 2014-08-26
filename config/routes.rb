Rails.application.routes.draw do
  devise_for :users
  scope :api do
    resources :stocks, defaults: {format: :json} do
      get :ohlc
    end
    get :derivatives, to: 'derivatives#index'
  end
  root 'stockapp#index'
end
