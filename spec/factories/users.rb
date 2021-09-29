FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { 'test' }
    first_name { 'mei' }
    last_name_kana { 'テスト' }
    first_name_kana { 'メイ' }
    birthday { '2000-01-01' }
  end
end
