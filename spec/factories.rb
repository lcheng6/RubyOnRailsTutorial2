FactoryGirl.define do
  factory :user do
    sequence(:name)     { |n| "Person #{n}" }
    sequence(:email)    { |n| "person_#{n}@example.com"}
    sequence(:address)  do |n|
      n_mod = n%6
      case n_mod
        when 0
          "Reston, VA"
        when 1
          "New York, NY"
        when 2
          "Washington, DC"
        when 3
          "Portland, OR"
        when 4
          "San Francisco, CA"
        when 6
          "San Diego, CA"
      end
    end
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    #content "Lorem ipsum"
    sequence(:content) { |n| Faker::Lorem.sentence + " #{n}" }
    user
  end

end