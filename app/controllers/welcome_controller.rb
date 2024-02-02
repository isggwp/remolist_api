class WelcomeController < ApplicationController
  def index
    render json: { about: 'Remolist API v.0.1' }
  end
end
