class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @review = @user.reviews_about_me.new
    #@review = Review.new(user: @user)
  end

  def create
    @user = User.find(params[:user_id])
    @review = current_user.reviews.build(review_params)
    @review.user = @user
    @review.save
    redirect_to user_path
  end
end
