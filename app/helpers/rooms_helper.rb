module RoomsHelper
  def mutual_follow?(user1, user2)
    user1_follows_user2 = Follow.where(follower_id: user1.id, followed_id: user2.id, accepted: true).exists?
    user2_follows_user1 = Follow.where(follower_id: user2.id, followed_id: user1.id, accepted: true).exists?

    user1_follows_user2 && user2_follows_user1
  end

  def followed_by_current_user?(current_user, target_user)
    Follow.where(follower_id: current_user.id, followed_id: target_user.id, accepted: true).exists?
  end

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
