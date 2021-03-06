class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:passwor])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to new_session_path
  end
  
end
