class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin
  	if user_signed_in?
	  	if current_user.admin == false
	  		redirect_to root_path
	  	end
	  else
	  	redirect_to root_path
	  end
  end
end
