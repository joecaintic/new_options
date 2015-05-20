class PostsController < ApplicationController

  def index
    @summaries = Summary.all
    authorize @summaries
  end
  
  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
    @comments = @post.comments.paginate(page: params[:page]).per_page(100)
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post
    if @post.save
      @post.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end


  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @topic.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
    end
  end

  # def per_page(num)
  #   Post.order('created_at DESC').page(params[:page]).per_page(num)
  # end

  private

def post_params
  params.require(:post).permit(:title, :body, :image)
end
end
