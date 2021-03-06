class SessionsController < ApplicationController
    
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to home_index_url
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
