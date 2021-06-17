class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        @user = user.try(:authenticate, params[:user][:password])
        if @user
            session[:user_id] = @user.id
        else
            redirect_to(controller:'sessions', action:'new')
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end