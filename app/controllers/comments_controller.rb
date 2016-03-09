class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    redirect_to topic_path(@topic)
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    redirect_to topic_path(@topic) 
  end

  def upvote
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.votes.create
    redirect_to topic_path(@topic)
  end

  def downvote
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.votes.last.destroy
    redirect_to topic_path(@topic)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:author, :text)
  end
end
