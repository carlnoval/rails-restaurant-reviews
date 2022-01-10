Rails.application.routes.draw do
  resources :restaurants do
    # collections and member routes are only for the properties of the model

    # collection url-path   - /restaurants/...    - /restaurants/top
    # member url-path       -/restaurant/:id/...  - /restaurants/:id/chef
    collection do
      # top is an arbitrary value
      #           Prefix Verb   URI Pattern                     Controller#Action
      #   top_restaurants GET    /restaurants/top(.:format)      restaurants#top
      # :top could also be written as a string
      get :top
      # get :top could also be written as per below but rails is here to make life easier
      # get 'top', to: 'restaurants#top', as: :top_restaurants

      # ditional routes may also be added
    end

    # collection url-path   - /restaurants/...    - /restaurants/top
    # member url-path       -/restaurant/:id/...  - /restaurants/:id/chef
    member do
      # chef is an arbitrary value
      #          Prefix Verb   URI Pattern                                       Controller#Action
      # chef_restaurant GET    /restaurants/:id/chef(.:format)                   restaurants#chef
      # :chef could also be written as a string
      get :chef

      # ditional routes may also be added
    end

    # nested `resources :restaurants do` because every review needs a restaurant_id coming from the url
    #                 Prefix Verb   URI Pattern                     Controller#Action
    #     restaurant_reviews POST   /restaurants/:restaurant_id/reviews(.:format)     reviews#create
    #  new_restaurant_review GET    /restaurants/:restaurant_id/reviews/new(.:format) reviews#new
    resources :reviews, only: [ :new, :create ]
  end

  # not nested cause does not need the id of the restaurant
  # Prefix Verb   URI Pattern                                       Controller#Action
  # review DELETE /reviews/:id(.:format)                            reviews#destroy
  resources :reviews, only: [ :destroy ]

  # For details on the DSL available within this file see https://guides.rubyonrails.org/routing.html
end
