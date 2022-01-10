class ReviewsController < ApplicationController
  # no only means will run :find_restaurant for both new and create
  before_action :find_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(strong_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def find_restaurant
    # no longer params[:id] since route is now different
    # route is now: /restaurants/:restaurant_id/reviews/new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def strong_params
    params.require(:review).permit(:content)
  end
end
