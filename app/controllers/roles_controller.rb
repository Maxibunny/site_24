# app/controllers/roles_controller.rb
class RolesController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all.includes(:roles)
  end

  def edit
    @user = User.find(params[:id])
    @role = @user.role.first_or_initialize # Получаем роль пользователя, если она существует
  end

  def update
    @user = User.find(params[:id])
    @role = @user.role.first_or_initialize
    @role.update(role_params)
    redirect_to roles_path, notice: "User role updated successfully"
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end

  def require_admin
    redirect_to root_path, alert: "You must be an admin to perform this action" unless current_user.admin?
  end
end
