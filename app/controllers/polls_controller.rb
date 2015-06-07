class PollsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      redirect_to @poll
      flash[:success]= 'Poll was successfully created.'
      else
        render 'new'
      end
  end


  def edit
    @poll = Poll.find_by_id(params[:id])
  end

  def update
    @poll = Poll.find_by_id(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated'
      redirect_to @poll
    else
      render 'edit'
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    flash[:success] =  'Poll was successfully deleted.'
    redirect_to polls_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
    end
end
