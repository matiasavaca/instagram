class Follow < ApplicationRecord
  before_create :check_privacy
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :followed, class_name: 'User', foreign_key: 'followed_id'

  # app/models/follow.rb
  after_create_commit do
    broadcast_prepend_to "follows_list", target: "navbar_follow", partial: "follows/follow", locals: { follow: self }
  end



  def accept
    self.update(accepted: true)
  end

  private

  def check_privacy
    self.accepted = true unless self.followed.private
  end
end
