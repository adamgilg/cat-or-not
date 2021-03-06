Cats::Application.routes.draw do
  resources :cats do
    member do
      post :rating
      get :photo
    end
  end
  resources :comments, only: [:create, :show, :destroy]

  root :to => "cats#index"
end
