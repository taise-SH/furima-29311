FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    last_name {'鷹'}
    first_name {'肩'}
    last_name_kata {'カカ'}
    first_name_kata {'タタ'}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {'2000-2-2'}
  end
end
