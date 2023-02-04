FactoryBot.define do
  factory :user do
    name {"鈴木一郎"}
    name_reading {"スズキイチロウ"}
    nickname {"ichiro"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password}
    password_confirmation {password}
  end
end
