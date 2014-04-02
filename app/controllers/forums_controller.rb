class ForumsController < ApplicationController
	def index
		@forum = Forum.all		
	end
	def show
		@forum = Forum.find(params[:id])			
	end
	def new
		@forum = Forum.new
		
	end
	def create
		@forum = Forum.new(forum_params)
		@forum.user = current_user
		if @forum && @forum.save
			flash[:notice] = 'Your forum was create successfully'
			redirect '/forums'
		else
			flash[:alert] = 'There was a problem creating your forum'
			redirect '/forums'
		end
	end
	private
	def forum_params
		params.require(:forum).permit(:title, :post)
	end

end