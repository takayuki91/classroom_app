Rails.application.routes.draw do
  
  resources :students, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  
  resources :classrooms, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
