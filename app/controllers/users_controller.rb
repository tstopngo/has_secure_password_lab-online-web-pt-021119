class UsersController < ApplicationController

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to '/' unless @user.save
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  private
    def user_params
      params.require(:user).permit(
                                    :name,
                                    :password,
                                    :password_confirmation
                                  )
    end
end
