class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    @comments = @prototype.comments.includes(:user)
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      render "prototypes/show"
      binding.pry
    end
  end

  def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
