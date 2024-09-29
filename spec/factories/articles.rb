FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "My title ##{n}" }
    sequence(:body) { |n| "MyText #{n}" }
    sequence(:slug) { |n| "MyString #{n}" }
  end
end
