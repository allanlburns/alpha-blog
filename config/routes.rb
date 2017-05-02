Rails.application.routes.draw do
	root 'pages#home'
	get 'about', to: 'welcome#about'

	# generates RESTful routes for resources (try rake routes with and without "resources")
	resources :articles
end
