Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :destinations, only: :show
  resources :bloggers, only: [:show, :new, :create]
  resources :posts, only: [:show, :new, :create, :edit, :update]

  get "/posts/:id/like", to: "posts#like", as: "post_like"
end
