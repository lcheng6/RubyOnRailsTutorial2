namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #make_single_admin_user
    make_99_common_users
  end
end

def make_single_admin_user
  User.create!(name: "Example User",
               email: "example@railstutorial.org",
               password: "foobar",
               password_confirmation: "foobar",
               admin: true)
end

def make_99_common_users
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
    end
end
