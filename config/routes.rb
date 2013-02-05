Cats::Application.routes.draw do
  resources :cats do
    member do
      post :rating
    end
  end
end
