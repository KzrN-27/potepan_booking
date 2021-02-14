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
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update_attributes!(user_params)
            redirect_to(account_path)
        end
    end
    def account
        @user = User.find(params[:id])
    end
    def profile
        @user = User.find(params[:id])
    end
    def confirm
        @user = User.find(params[:id])
    end
    def pass
        @user = User.find(params[:id])
        if @user.authenticate(user_params[:password])
            redirect_to(edit_user_path)
        else
            render "users/confirm"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :introduce)
    end
end
