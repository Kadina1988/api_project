FactoryBot.define do
  factory :user do
    name { "Joe Smith" }
    sequence(:login) { |n| "jsmith#{n}" }
    url { "http://example.com" }
    avatar_url { "http://example.com/avatar" }
    provider { "Github" }
  end
end
