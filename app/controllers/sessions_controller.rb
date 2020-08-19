class SessionsController < ApplicationController
  include SessionsHelper

  def new
    logged_in_notice if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in(user)
      flash[:light] = "Welcome #{user.name} !"
      redirect_to user
    else
      flash.now[:warning] = 'Email and password are wrong'
      render :new
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end
end