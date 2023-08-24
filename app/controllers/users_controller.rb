class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    if params[:search_query].present?
      @users = User.where('username LIKE ?', "%#{params[:search_query]}%")
    else
      @users = []
    end

    if turbo_frame_request?
      render partial: 'layouts/search_results',locals: {users: @users}
    end
  end

  def show
  end

  def show_messages
    @users = User.all_except(current_user)

    @room = Room.new
    @rooms = Room.public_rooms
    @room_name =get_name(@user, current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)

    @messages = @single_room.messages.order(created_at: :asc)
    render 'rooms/index'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
