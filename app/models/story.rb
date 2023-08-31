class Story < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :images, presence: true
end
