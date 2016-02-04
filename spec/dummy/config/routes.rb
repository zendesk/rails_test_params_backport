Rails.application.routes.draw do
  resources :home, only: :index do
    get :headers, on: :collection
  end
end
