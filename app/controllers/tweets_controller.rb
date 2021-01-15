class TweetsController < ApplicationController

    def index
      @tweet = Tweet.all
    end

    def create
      @tweet = Tweet.new(tweet_params)
    end

    def new
    end

    private

    def tweet_params
      params.require(:tweet).permit(:title, :image, :concept).merge(user_id: current_user.id)
    end


end
