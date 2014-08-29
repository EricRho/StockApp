class WelcomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  layout :choose_layout

  def index
  end

  def stockapp
  end

  def choose_layout
    user_signed_in? ? "application" : "application"
  end
end
