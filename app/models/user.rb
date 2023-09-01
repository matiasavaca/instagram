class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_prepend_to "users" }

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :posts
  has_many :likes
  has_one_attached :profile_picture

  has_many :comments

  has_many :follow_requests, -> { where accepted: false }, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :accepted_recieved_requests, -> { where accepted: true }, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :accepted_sent_requests, -> { where accepted: true }, class_name: 'Follow', foreign_key: 'follower_id'

  has_many :stories, dependent: :destroy

  has_many :waiting_sent_requests, -> { where accepted: false }, class_name: 'Follow', foreign_key: 'follower_id'

  has_many :followers, through: :accepted_recieved_requests, source: :follower
  has_many :followings, through: :accepted_sent_requests, source: :followed
  has_many :waiting_followings, through: :waiting_sent_requests, source: :followed

  def follow(user)
    Follow.create(follower: self, followed: user)
  end


  def unfollow(user)
    self.accepted_sent_requests.find_by(followed: user)&.destroy
  end

  def cancel_request(user)
    self.waiting_sent_requests.find_by(followed: user)&.destroy
  end

  def viewed_stories
    story_histories.map(&:story)
  end
end
