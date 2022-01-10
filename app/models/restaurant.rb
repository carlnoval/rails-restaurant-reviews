class Restaurant < ApplicationRecord
  # added after adding review model
  # dependent: :destroy - if restaurante gets deleted, reviews for the restaurant also gets delete
  # allows for method   - @any_restaurant.reviews
  has_many :reviews, dependent: :destroy
end
