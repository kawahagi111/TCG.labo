FactoryBot.define do
    factory :tweet do
     title                {'デッキ'}
     concept              {'強いです'}
  
      after(:build) do |tweet|
        tweet.image.attach(io: File.open('app/assets/images/search.png'), filename: 'search.png')
      end
    end
  end