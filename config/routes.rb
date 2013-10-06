SocialReview::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  post '/employees/new', to: 'employees#new'
end