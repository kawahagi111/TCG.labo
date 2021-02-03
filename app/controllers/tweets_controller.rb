class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :search]
  before_action :move_to_index, except: [:index, :show, :create, :new, :search]
  impressionist actions: [:show]

  def index
    @search = Tweet.ransack(params[:q])
    @tweet = @search.result
    @tweet.order('created_at DESC')
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
    impressionist(@tweet, nil, unique: [:session_hash])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :image, :concept).merge(user_id: current_user.id)
  end

  def move_to_index
    tweet = Tweet.find(params[:id])
    redirect_to action: :index unless tweet.user_id == current_user.id
  end
end
