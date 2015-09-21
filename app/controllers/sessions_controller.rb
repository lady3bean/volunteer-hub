class SessionsController < ApplicationController
  def new
  end

  def login
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      redirect_to controller: 'reg_forms', action: 'new'
      session[:user_id] = user.id
    else
      redirect_to controller: 'sessions', action: 'login', flash: { alert: 'Incorrect credentials' }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path flash: { alert: 'Logged out' }
  end
end