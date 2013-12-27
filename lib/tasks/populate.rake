namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Friend].each(&:delete_all)

    Friend.populate 100 do |friend|
      friend.name = Faker::Name.first_name
      friend.surname = Faker::Name.last_name
      friend.twitterUsername = Faker::Internet.user_name
      friend.email = Faker::Internet.email
    end
  end
end
