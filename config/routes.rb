# config/routes.rb

Rails.application.routes.draw do
  root to: proc { [200, { 'Content-Type' => 'application/json' }, ['{ "message": "API is running!" }']] }
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
             resources :articles do
              resources :comments, only: %i[index create update destroy]
            end
            resources :photos
end
