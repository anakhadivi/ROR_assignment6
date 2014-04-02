class UsersController < ApplicationController
	def index
		@users = User.all		
	end
	def show
		@user = User.find(params[:id])		
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user && @user.save
			flash[:notice] = 'Your account was created successfully'
			redirect_to user_path(@user)
		else
			flash[:alert] = 'There was a problem creating your account'
			redirect_to :back
		end
	end
	private
	def user_params
		params.require(:user).permit(:fname, :lname, :email, :password)	
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.update_attributes(user_params)
	end	
end