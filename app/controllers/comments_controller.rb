class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action [:correct_user, :admin_user], only: :destroy

  def create
    @forum = Forum.find(params[:comment][:forum_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment was created'
      redirect_to @forum
    else
      render @forum
    end
  end

  def destroy
    @comment.destroy
    redirect_to @forum
  end

  private

    def comment_params
      params.require(:comment).permit(:reply, :forum_id, :user_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to @forum if @comment.nil?
    end

    def admin_user
      redirect_to @forum unless current_user.admin?
    end

end
