class UsersController < ApplicationController
	before_action :find_user, only: [ :show, :edit, :update, :destroy, :following, :followers ]
	# before_action :authenticate_user!, except: [:followers, :following, :show ]

	def index
		@users = User.all
		@users = User.paginate(page: params[:page])
	end
	def show
		@tweets = @user.tweets.all()
	end

	def destroy
		flash[:success] = "User deleted Successfully"
		redirect_to users_path
	end

	def following
		@title = "Following"
		@users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
	end
	
	def followers
		@title = "Followers"
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end
	private

	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:feed)
	end
end
