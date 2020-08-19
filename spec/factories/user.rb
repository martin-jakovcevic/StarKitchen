
FactoryBot.define do
  factory :user do
    email { 'martin@martin.com' }
    name { 'Martin' }
    password { 'martin' }
    password_confirmation { 'martin' }
  end
end