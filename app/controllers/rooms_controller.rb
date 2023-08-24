class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    @rooms = Room.public_rooms
    if @room.save
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def index
    @room = Room.new
    @rooms = Room.public_rooms.reverse

    @users = User.all_except(current_user)
    render 'index'
  end

  def show
    @single_room = Room.find(params[:id])
    @room = Room.new
    @rooms = Room.public_rooms.reverse


    @message = Message.new
    @messages = @single_room.messages.order(created_at: :desc)

    @users = User.all_except(current_user)
    render 'index'
  end

  private

  def room_params
    params.require(:room).permit(:name, :user_id)
  end

  def method_name

  end
end
