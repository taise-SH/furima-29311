FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    delivery_day_id {2}
    postage_payer_id {2}
    prefecture_id {2}
    price {'4444'} 
    
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
