class AboutsController < ApplicationController
  def show
    @about = About.find(params[:id])
  end

  def new
    @about = About.new
  end

  def create
    @about = About.new(params[:about])
    if @about.save
      redirect_to users_edit_profile_path, :notice => "Profile About updated"
    else
      
    end
  end
end
