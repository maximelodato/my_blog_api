# app/models/jwt_denylist.rb

class JwtDenylist < ApplicationRecord
    include Devise::JWT::RevocationStrategies::Denylist
  end
  