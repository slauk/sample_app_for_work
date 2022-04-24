class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        forwading_url = session[:forwading_url]
        reset_session
        params[:session][:remember_me] == '1'? remember(user) : forget(user)
        log_in user
        redirect_to forwading_url || user
      else
        message = "Account is not activated. "
        message += "Check your email for the activation link"
        flash[:warning] = message
        redirect_to root_url
      end      
    else
      flash.now[:danger] = "Invalid email or password combination!"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
