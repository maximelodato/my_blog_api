# app/controllers/users/registrations_controller.rb

class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: { message: 'Inscription réussie.', user: resource }, status: :ok
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
  