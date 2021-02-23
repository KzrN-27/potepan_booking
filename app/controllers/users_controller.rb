class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :account, :profile, :confirm, :pass]
    before_action :correct_user, only: [:edit, :update, :account, :profile, :confirm, :pass]

    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user && @user.save
            flash[:notice] = "ユーザー登録に成功しました"
            login_user(@user)
            redirect_to(rooms_top_path)
        else
            flash.now[:alert] = "ユーザー登録に失敗しました"
            render "users/new"
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
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user.id == current_user.id
    end
end
