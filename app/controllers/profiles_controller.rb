class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end 
  end

  private

  def set_profile
    @profile = User.find(current_user.id)  
  end

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :avatar_cache)
  end
end
