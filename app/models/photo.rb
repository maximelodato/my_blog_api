class Photo < ApplicationRecord
  belongs_to :user
end
# app/models/photo.rb

class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
end
