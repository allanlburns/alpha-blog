Rails.application.routes.draw do
	root 'pages#home'
	get 'about', to: 'pages#about'

	# generates RESTful routes for resources (try rake routes with and without "resources")
	resources :articles

	get 'signup', to: 'users#new'
	resources :users, except: [:new]

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
end
