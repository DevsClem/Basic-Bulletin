class UsersController < ApplicationController
  layout "users"
  
  def show
    @user = User.find(params[:id])
    @friends = @user.friends
  end

  def search
    user = User.find_by("full_name = ?", params[:name])
    
    if user.nil?
      flash[:search_error] = "User does not exist"
      redirect_to "/bulletin"
    else
      redirect_to "/profile/#{user.id}"
    end
  end

end
