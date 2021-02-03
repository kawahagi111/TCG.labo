class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to tweet_path(params[:tweet_id])
    else
      @tweet = Tweet.find(params[:tweet_id])
      @comments = @tweet.comments.includes(:user)
      render 'tweets/show'
    end
  end

  def show
    @comment = Comment.new(comment_params)
    @comments = @tweet.comments.includes(:user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
