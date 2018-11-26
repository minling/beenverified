FactoryBot.define do
  factory :link do
    access_count 1
  end

  trait :facebook do
    url 'https://Facebook.com'
  end

  trait :beenverified do 
    url 'https://beenverified.com'
  end


end