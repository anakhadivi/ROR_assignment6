class ApplicationController < ActionController::Base
	def current_user
		if session[:user_id]
			User.find(session[:user_id])
		else
			nil
		end
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
