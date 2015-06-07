class ProblemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  before_action :admin_user, only: :destroy

  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      flash[:success] = 'Guestbook comment added successfully'
      redirect_to(problems_url)
    else
      render 'new'
    end
  end

  def destroy
    @problem = Problem.find_by_id(params[:id])
    @problem.destroy
    flash[:success] = 'Question deleted'
    redirect_to(problems_url)
  end

  private

  def problem_params
    params.require(:problem).permit(:doubt)
  end

  def admin_user
    redirect_to(problems_url) unless current_user.admin?
  end

end
