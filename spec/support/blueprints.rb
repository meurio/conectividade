require 'machinist/active_record'

User.blueprint do
  first_name { Faker::Name.last_name }
  last_name  { Faker::Name.first_name }
  email      { Faker::Internet.email }
end
