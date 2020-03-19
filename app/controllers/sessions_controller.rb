class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :destroy]

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to estimates_path
        else 
            redirect_to root_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end