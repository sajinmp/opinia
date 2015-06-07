class ForumsController < ApplicationController

  before_action :admin_user, except: [:index, :show]

  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find(params[:id])
    @comments = @forum.comments.order('created_at DESC')

  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      flash[:success] = 'Forum was created'
      redirect_to @forum
    else
      render 'new'
    end
  end

  def destroy
  end

  private

    def forum_params
      params.require(:forum).permit(:title, :content)
    end

    def admin_user
      redirect_to (forums_url) unless current_user.admin?
    end

end
