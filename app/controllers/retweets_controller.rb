class RetweetsController < ApplicationController
	def create
		@tweet = Tweet.find(params[:tweet_id])
		@retweet = @tweet.retweets.create(params[:retweet].permit(:retweet))
		@retweet.user_id = current_user.id if current_user
		@retweet.save

		if @retweet.save
			redirect_to tweet_path(@tweet)
		else
			render 'new'
		end
	end

	def edit
		@tweet = Tweet.find(params[:tweet_id])
		@retweet = @tweet.retweets.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:tweet_id])
		@retweet = @tweet.retweets.find(params[:id])

		if @retweet.update(params[:retweet].permit(:retweet))
			redirect_to tweet_path(@tweet)
		else
			render 'edit'
		end

	end

	def destroy
		@tweet = Tweet.find(params[:tweet_id])
		@retweet = @tweet.retweets.find(params[:id])
		@retweet.destroy
		redirect_to tweet_path(@tweet)
	end
	
end
