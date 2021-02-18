class RoomsController < ApplicationController
  before_action :logged_in_user, except: :top

  def top
    @room = Room.new
  end
  def new
    @room = Room.new
  end
  def create
    @room = @current_user.rooms.new(room_params)
    if @room && @room.save
      redirect_to @room
    else
      render "rooms/new"
    end
  end
  def show
    @room = Room.find(params[:id])
  end
  def update
    @room = Room.find(params[:id])
    if @room.update(room_update_params)
      redirect_to(reserved_path)
    else
      render "rooms/show"
    end
  end
  def index
    @rooms = Room.where("area LIKE ?", "%#{room_params[:area]}%")
  end
  def reserved
    @rooms = Room.where(reserved_id: current_user.id)
  end
  def registered
    @rooms = Room.where(user_id: current_user.id)
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduce, :price, :area, :image)
  end
  def room_update_params
    params.require(:room).permit(:start, :end, :num, :reserved_id)
  end
end
