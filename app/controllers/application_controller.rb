class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    if user.nil?
      session.delete(:user_id)
    else
      session[:user_id] = user.id
    end
  end

  helper_method :current_user

  private
	def not_authenticated
  		redirect_to login_path, alert: "Please login first"
	end
end
