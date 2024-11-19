# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      render json: { message: 'Vous êtes connecté.', user: resource }, status: :ok
    end
  
    def respond_to_on_destroy
      render json: { message: 'Déconnexion réussie.' }, status: :ok
    end
  end
  