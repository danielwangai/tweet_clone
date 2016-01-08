class StaticPagesController < ApplicationController
  def index
  	@tweets = Tweet.all.order("created_at DESC").paginate(page: params[:page])
  end
end
