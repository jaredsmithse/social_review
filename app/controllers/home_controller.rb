class HomeController < ApplicationController
  def index
  	@users = User.all
    redirect_to "/users/#{current_user.id}" if current_user
  end
end
