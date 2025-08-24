class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_profile
    @profile = current_user  
  end
end
