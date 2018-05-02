class CommentsController < ApplicationController



  def create
    @model = comment_params[:commentable_type].constantize.find(comment_params[:commentable_id])
    @comment = @model.comments.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :commentable_id, :commentable_type)
  end


end
