namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_single_admin_user
    make_99_common_users
    make_sample_microposts
    make_relationships
  end
end

def make_single_admin_user
  User.create!(name: "Example User",
               email: "example@railstutorial.org",
               password: "foobar",
               password_confirmation: "foobar",
               admin: true,
               address: "New York, NY",
               description: Faker::Lorem.sentence(5),
               latitude: Faker::Address.latitude,
               longitude: Faker::Address.longitude
  )
end

def make_99_common_users
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "foobar"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 address: "New York, NY",
                 description: Faker::Lorem.sentence(5),
                 latitude: Faker::Address.latitude,
                 longitude: Faker::Address.longitude)
    end
end

def make_sample_microposts
  users = User.all(limit: 50)
  50.times do
    content = Faker::Lorem.sentence(5)
    latitude = Faker::Address.latitude
    longitude = Faker::Address.longitude
    users.each { |user| user.microposts.create!(content: content) }
  end
end


def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
