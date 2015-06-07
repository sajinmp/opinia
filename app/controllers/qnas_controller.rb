class QnasController < ApplicationController
  # before_action :set_qna, only: [:show, :edit, :update, :destroy]

  # GET /qnas
  # GET /qnas.json

  # GET /qnas/1
  # GET /qnas/1.json

  # GET /qnas/new
  def new
    @qna = Qna.new
  end

  # GET /qnas/1/edit

  # POST /qnas
  # POST /qnas.json
  def create
    @qna = Qna.new(qna_params)

    if @qna.save
      flash[:success] = 'Question was successfully created.' 
      redirect_to root_url 
    else
      render 'new'
    end
  end

  # PATCH/PUT /qnas/1
  # PATCH/PUT /qnas/1.json

  # DELETE /qnas/1
  # DELETE /qnas/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qna
      @qna = Qna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qna_params
      params.require(:qna).permit(:ques, :mail)
    end
end
