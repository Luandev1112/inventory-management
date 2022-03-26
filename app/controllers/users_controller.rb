class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :get_user_by_id, only: [:edit, :update, :show, :correct_user, :change_password, :update_password, :current_allotments]
  before_action :correct_user, only: [:edit, :update, :change_password, :update_password]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, flash: { success: "Welcome to the Henlo IMS, #{@user.name}!" }
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_edit_params)
      redirect_to @user, flash: { success: "Profile updated." }
    else
      render 'edit'
    end
  end

  def change_password
  end

  def update_password
    if @user.update_attributes(user_pwd_params)
      redirect_to @user, flash: { success: "Successfully changed password." }
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, flash: { success: "User deleted." }
  end

  def current_allotments
    @allotments = Allotment.where({user_id: [params[:id]], dealloted_at: nil})
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :mobile_no, :password, :password_confirmation)
    end

    def user_edit_params
      params.require(:user).permit(:name, :email, :mobile_no)
    end

    def user_pwd_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def correct_user
      redirect_to(root_url) unless @user == current_user
    end

    def get_user_by_id
      @user = User.find(params[:id])
    end
end
