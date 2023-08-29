class Room < ApplicationRecord
  validates_uniqueness_of :name
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy

  scope :public_rooms, -> { where(is_private: false) }

  after_create_commit do
    broadcast_if_public
  end

  def broadcast_if_public
    broadcast_prepend_to 'rooms' unless self.is_private
  end

  def self.create_private_room(users, room_name, primary_user)
    single_room = Room.new(name: room_name, is_private: true, user: primary_user)
    if single_room.valid?
      single_room.save
      users.each do |user|
        Participant.create(user_id: user.id, room_id: single_room.id)
      end
    else
      Rails.logger.error("Failed to create private room. Errors: #{single_room.errors.full_messages.join(', ')}")
    end
    single_room
  end
end
