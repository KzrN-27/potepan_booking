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
      flash[:notice] = "ルーム登録しました"
      redirect_to @room
    else
      flash.now[:alert] = "ルーム登録に失敗しました"
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
    if index_params[:area] && index_params[:keyword]
      @rooms = Room.where("area LIKE ? OR name LIKE ?", "%#{index_params[:area]}%", "%#{index_params[:keyword]}%")
    elsif index_params[:area]
      @rooms = Room.where("area LIKE ?", "%#{index_params[:area]}%")
    elsif index_params[:keyword]
      @rooms = Room.where("name LIKE ?", "#{index_params[:keyword]}")
    else
      @rooms = Room.all
    end
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
  def index_params
    params.permit(:area, :keyword)
  end
  def room_update_params
    params.require(:room).permit(:start, :end, :num, :reserved_id)
  end
end
