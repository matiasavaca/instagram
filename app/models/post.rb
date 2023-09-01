class Post < ApplicationRecord
  belongs_to :user

  validates :images, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  has_many_attached :images
  # validates :images, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], message: 'Must be an image format' }

  # validates :images, presence: true, blob: { content_type: :images }
  def last_image
    images.last
  end

end
