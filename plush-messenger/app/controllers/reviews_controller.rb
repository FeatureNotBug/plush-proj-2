class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @review = Review.new(otheruser: @user)
  end
end
