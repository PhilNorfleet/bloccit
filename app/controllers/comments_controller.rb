class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    #authorize @comments
  end

  def new
    @comment = Comment.new
    #authorize @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment.post = @post
    @comment.user = @user
    @topic = @post.topic
    #authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end



  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
