FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    sequence(:email) { |n| "#{n}-#{Faker::Internet.email}" }
    school     Faker::Company.name
    age        Faker::Number.between(15, 50)
    state      Faker::Address.state
    city       Faker::Address.city
    area_code  Faker::Number.between(10, 99)
    phone      Faker::PhoneNumber.cell_phone
  end

  factory :message do
    user
  end
end
