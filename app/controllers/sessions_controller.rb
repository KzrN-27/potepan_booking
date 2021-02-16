class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password])
            log_in(@user)
            redirect_to(rooms_top_path)
        else
            render "sessions/new"
        end
    end
    def destroy
        log_out
        redirect_to rooms_top_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
