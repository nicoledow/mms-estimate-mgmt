class ApplicationController < ActionController::Base
    before_action :require_login
    protect_from_forgery

private
    def require_login
        if !session[:user_id]
        flash[:login_required] = "Log in required." 
        redirect_to root_path
        end
    end
end
