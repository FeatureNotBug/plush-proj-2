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
      redirect_to users_edit_profile_path, :notice => "Profile updated"
    else
      
    end
  end

  private
  def about_params
    params.require(:about).permit(:aboutme, :links)
  end
end
