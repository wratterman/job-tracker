Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments
    end
  end
  resources :tags
  resources :categories
  resources :contacts, only: [:create, :show]
end
