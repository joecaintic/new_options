 class SummariesController < ApplicationController

  def index
    @summaries = Summary.all
    authorize @summaries
  end

  def show
    @summary = Summary.find(params[:id])
    @post = @summary.post
    authorize @summary
  end

  def new
    @summary = Summary.new
    authorize @summary
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:name, :description, :public))
      authorize @summary
    if @summary.save
      redirect_to @summary, notice: "Summary was saved successfully."
    else
      flash[:error] = "Summary creating topic. Plese try again."
      render :new
    end
  end

 end