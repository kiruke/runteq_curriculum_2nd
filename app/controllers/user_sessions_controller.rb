class UserSessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path, success: t('.login_successful')
    else
      flash.now[:danger] = t('.login_failed')
      render action: 'new'
    end
  end

  def destroy
    logout
    #flash[:success] = t('.logout_successful')
    #redirect_to root_path
    #Rails.logger.debug session.inspect
    redirect_to root_path, success: t('.logout_successful')
  end
end
