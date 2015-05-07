 class SummariesController < ApplicationController


  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:name, :description, :public))
    @summary.post = @post
    authorize @summary
    if @summary.save
      redirect_to [@topic, @post, @summary], notice: "Summary was saved successfully."
    else
      flash[:error] = "Error creating summary. Plese try again."
      render :new
    end
  end

 end