namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_tweets
		make_relationships
	end
end

def make_users
	99.times do |n|
		email = "example-#{n+1}@web.org"
		password = "password"
		User.create!(
		email:email,
		password: password)
	end
end

def make_tweets
	users = User.all(limit: 6)
	50.times do
		content = Faker::Lorem.sentence(5)
		users.each { |user| user.tweets.create!(content: content) }
	end
end

def make_relationships
	users = User.all
	user = users.first
	followed_users = users[2..50]
	followers = users[3..40]
	followed_users.each { |followed| user.follow!(followed) }
	followers.each { |follower| follower.follow!(user) }
end