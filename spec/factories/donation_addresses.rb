FactoryBot.define do
  factory :donation_address do
    price {rand(1..1000000)}
    postal_code { '123-4567' }
    prefecture { rand(1..47) }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
  end
end
