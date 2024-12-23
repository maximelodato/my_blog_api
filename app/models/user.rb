# app/models/user.rb

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
         has_many :articles, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :photos, dependent: :destroy
end
