FactoryGirl.define do
  factory :user do
    email 'test@test.test'
    password 'testtesttest'
    password_confirmation 'testtesttest'
  end
  factory :friend do
    id 789789
    name 'testName'
    surname 'testSurname'
    twitterUsername 'testest'
    email 'test@test.com'
  end
  factory :friend2 do
    id 789789222
    name 'testName222'
    surname 'testSurname222'
    twitterUsername 'testest222'
    email 'test222@test222.com'
  end
end
