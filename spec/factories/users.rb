FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1q2w3e' }
    password_confirmation { password }
    last_name { 'てすと' }
    first_name { 'めい' }
    last_name_kana { 'テスト' }
    first_name_kana { 'メイ' }
    birthday { '2000-01-01' }
  end
end
