Rails.application.routes.draw do
  scope :api do
    resources :stocks, defaults: {format: :json}
  end

  root 'stockapp#index'
end
