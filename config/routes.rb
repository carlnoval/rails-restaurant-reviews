Rails.application.routes.draw do
  resources :restaurants do
    # collection path   - /restaurants/...    - /restaurants/top
    # member path       -/restaurant/:id/...  - /restaurants/:id/chef
    collection do
      # top is an arbitrary value
      #           Prefix Verb   URI Pattern                     Controller#Action
      #   top_restaurants GET    /restaurants/top(.:format)      restaurants#top
      get :top
      # get :top could also be written as per below but rails is here to make life easier
      # get 'top', to: 'restaurants#top', as: :top_restaurants

      # ditional routes may also be added
    end

    # collection path   - /restaurants/...    - /restaurants/top
    # member path       -/restaurant/:id/...  - /restaurants/:id/chef
    member do
      get :chef

      # ditional routes may also be added
    end
  end 

  # For details on the DSL available within this file see https://guides.rubyonrails.org/routing.html
end
