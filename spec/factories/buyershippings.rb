FactoryBot.define do
  factory :Buyershipping do
    user_id                  { '1' }
    postal_code              { '123-4567' }
    prefecture_id            { 1 }
    city                     { '市町村' }
    address                  { '自分の住所1' }
    building                 { '自分の住所2' }
    telephone                { '09012345678' }
    token                    {'tok_abcdefghijk00000000000000000'}
  end
end