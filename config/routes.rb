Rails.application.routes.draw do
  # Authentication
  resource :session
  resources :passwords, param: :token

  # Public pages
  root "pages#home"
  get "podcasts", to: "podcasts#index"
  get "blog", to: "blog#index"
  get "blog/:slug", to: "blog#show", as: :blog_post

  # Booking flow
  get "book", to: "bookings#intro"
  get "book/topics", to: "bookings#topics"
  get "book/topics/:id/times", to: "bookings#times", as: :book_times
  post "book/checkout", to: "bookings#checkout"
  get "book/success", to: "bookings#success"

  # Webhooks
  post "webhooks/polar", to: "webhooks#polar"

  # Admin
  namespace :admin do
    root to: "dashboard#index"
    resources :posts
    resources :podcast_episodes
    resources :consultation_topics
    resources :time_slots
    resources :bookings, only: [ :index, :show ]
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
