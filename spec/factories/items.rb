FactoryBot.define do
  factory :item do      
    association :user
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
      end
    title                 { '題名' }
    explanation           { '説明' }
    category_id           { 1 }
    status_id             { 1 }
    delivery_fee_id       { 1 }
    prefecture_id         { 1 }
    delivery_days_id      { 1 }
    price                 { 300 }
  end
end