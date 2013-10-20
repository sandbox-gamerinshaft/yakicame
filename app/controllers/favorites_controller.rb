class FavoritesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    current_user.favorites.create(tweet: @tweet)
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @favorite = current_user.favorites.find_by_tweet_id(params[:tweet_id])
    @favorite.destroy
    redirect_to tweets_path
  end
end
