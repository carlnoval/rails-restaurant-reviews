class ReviewsController < ApplicationController
  # no only means will run :find_restaurant for both new and create
  before_action :find_restaurant, except: [ :destroy ]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(strong_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # render means render a page, for this case we're rendering the new page

      # what happens:
      # we're going to stay in the create action but display the template of the new page
      # the only diffirence is that
      #   - the instance of review is no longer the one from the #new method
      #   - the instance of reveiew being used is the one that got failed to save

      # rails c -> new_review = Review.new -> new_review.restaurant = Restaurant.all.sample -> new_review.save # => false
      # new_review.errors.message -> new_review.errors.messages           # => {:content=>["can't be blank"]}
      # in the UI creating a review with empty valie shows error message  # => Content can't be blank
      # simple_form_for takes care of the message from previous line and making the box red
      render :new
    end
  end

  def destroy
    # no need for @ since this review instance is not passed to the view
    review = Review.find(params[:id])
    review.destroy
    redirect_to restaurant_path(review.restaurant)
  end
  private

  def find_restaurant
    # params[:restaurant_id] instead of params[:id] to differentiate which id to use
    # params[:restaurant_id] came from:
    #                 Prefix Verb   URI Pattern                     Controller#Action
    #     restaurant_reviews POST   /restaurants/:restaurant_id/reviews(.:format)     reviews#create
    #  new_restaurant_review GET    /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def strong_params
    params.require(:review).permit(:content)
  end
end
