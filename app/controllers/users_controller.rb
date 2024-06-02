class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.email.include?("@")
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Welcome to the app, #{@user.email}!"
      else
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Invalid email format. Please enter a valid email address."
      render :new, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end