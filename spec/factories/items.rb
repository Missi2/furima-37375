FactoryBot.define do
  factory :item do
    item_name {Faker::Camera.brand_with_model}
    explanatory {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 1, to:10)}
    condition_id {Faker::Number.between(from: 1, to: 6)}
    delivery_id {Faker::Number.between(from: 1, to: 2)}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    shipping_day_id {Faker::Number.between(from: 1, to: 3)}
    price {Faker::Number.between(from: 300, to:9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_lion.jpeg'), filename: 'test_lion.jpeg')
    end
  end
end