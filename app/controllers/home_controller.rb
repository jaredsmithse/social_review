class HomeController < ApplicationController
  def index
    redirect_to "/users/#{current_user.id}" if current_user
  end
end
