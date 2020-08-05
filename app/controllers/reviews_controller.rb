class ReviewsController < ApplicationController
    before_action :set_review, only: [:show]
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end 

 def create
    @review = Review.new(reviews_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to (@restaurant)
    else
      render :new
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
