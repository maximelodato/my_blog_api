# app/controllers/photos_controller.rb

class PhotosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_photo, only: %i[show update destroy]
    before_action :authorize_user!, only: %i[update destroy]
  
    def index
      @photos = Photo.all
      render json: @photos.map { |photo| photo_response(photo) }
    end
  
    def create
      @photo = current_user.photos.build(photo_params)
      if @photo.save
        render json: photo_response(@photo), status: :created
      else
        render json: @photo.errors, status: :unprocessable_entity
      end
    end
  
    # ...
  
    private
  
    def photo_response(photo)
      photo.as_json.merge(image_url: url_for(photo.image))
    end
  end
  