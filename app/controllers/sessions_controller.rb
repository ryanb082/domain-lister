class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params(:email)).first
    if user && user.authenticate(params[:password])
      session[:user_id] = @user.id 
      flash[:notice] = "Welcome, you have logged in."
      redirects_to root_path
    else 
      flash[:notice] = "Your email or password was incorrect."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end