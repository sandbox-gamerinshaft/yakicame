class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new

  end

  def new
  end

  def create
    @tweet = Tweet.new(params[:id])
    @tweet.save
    redirect_to tweets_path()
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
