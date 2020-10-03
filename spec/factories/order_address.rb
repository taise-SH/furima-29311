FactoryBot.define do
  factory :order_address do
    post_cord { '123-4567' }
    prefecture_id { 1 }
    city { '千葉市中央区' }
    address {'井野123-56'}
    building_name {'スカイプラザ'}
    phone_number {'08044445555'}
    token {'token_test'}
  end
end
