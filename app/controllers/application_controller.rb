class ApplicationController < ActionController::Base
<<<<<<< HEAD
=======
    include SessionsHelper
    before_action :require_login
    helper_method :current_user, :logged_in?

    private
    def require_login
        unless logged_in?
            redirect_to login_path, alert: "ログインしてください"
        end
    end
>>>>>>> main
end
