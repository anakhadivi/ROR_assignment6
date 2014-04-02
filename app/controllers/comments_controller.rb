class CommentsControler < ApplicationController 
	def new
		@forum = Forum.find(params[:forum_id])
		@comment = @forum.comments.new
	end
	def create
		@comment = Comment.new(comment_params)
		@comment.forum_id = params[:forum_id]
		@comment.user = current_user
		if @comement.save
			flash[:notice] = 'Your Comment was saved successfully'
			redirect_to forum_path(@comment.forum)
		else
			flash[:alert] = 'There was a problem saving your comment'
			redirect_to forum_path(@comment.forum)
		end
	end
	private
	def comment_params
		params.require(:comment).permit(:title,:post)
	end
end