class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = "Welcome, you have logged in."
      redirect_to domains_path
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