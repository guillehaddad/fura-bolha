class CommentsController < ApplicationController
  def create
		@bolha = Bolha.find(params[:comment][:bolha_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.bolha_id = @bolha.id
		respond_to do |format|
			if @comment.save
				@comments = @bolha.comments
				format.js {}
			else
				format.html { render :new }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :bolha_id, :content)
	end
end
