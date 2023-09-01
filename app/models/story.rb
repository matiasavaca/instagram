class Story < ApplicationRecord
  belongs_to :user
  has_many :story_histories, dependent: :destroy
  has_many_attached :images

  validates :images, presence: true

  def viewers
    story_histories.map(&:user)
  end

  # In post.rb
  def last_image
    images.last
  end

end
