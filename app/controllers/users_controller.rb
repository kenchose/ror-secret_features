class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      secret[:user_id] = @user.id
      redirect new_session_path
    else
      flash[:errors]=@user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @secrets = Secret.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

