class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(post_params)
    @comment.post = @post
    @topic = @post.topic
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
    redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

   def destroy
     @post = Post.find(params[:post_id])
     @topic = @post.topic
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end
   end


respond_to do |format|
  format.html
  format.js
end

private

def post_params
  params.require(:comment).permit(:body)
end
end