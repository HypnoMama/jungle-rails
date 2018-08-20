class SessionsController < ApplicationController

  def new
  end

  def create
    # user = User.find_by email: params[:email]
    # user = @user
    # if user && user.authenticate(params[:password])
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id 
      redirect_to :products
    else 
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :products
  end


end


