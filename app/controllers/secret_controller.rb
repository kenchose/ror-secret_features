class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
    @user = User.find(params[:id])
  end

  def show
  end

  def create
    @user = current_user
    @secrets = Secret.new(user: @user, content: params[:content])
    if @secrets.save
      redirect_to @user
    end
  end

end
