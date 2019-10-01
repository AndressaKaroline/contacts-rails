Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
	post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
