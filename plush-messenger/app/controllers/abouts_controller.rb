class AboutsController < ApplicationController
  def show
    @about = About.find(params[:id])
  end

  def new
    @about = About.new
  end

  def edit 
    @about = About.find(params[:id])
  end

  def create
    @about = About.new(about_params)
    if @about.save
      current_user.about = @about
      redirect_to users_edit_profile_path, :notice => "Profile (new) updated"
    else
      render 'new'
    end
  end

  def update
    @about = About.find(params[:id])
    if @about.update_attributes(about_params)
      #Handle success
      redirect_to users_edit_profile_path, :notice => "Profile updated"
    else 
      render 'edit'
    end
  end

  private
  def about_params
    params.require(:about).permit(:aboutme, :links)
  end
end
