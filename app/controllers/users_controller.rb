class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user && @user.save
            redirect_to(rooms_top_path)
        end
    end


    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
