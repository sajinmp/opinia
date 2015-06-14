namespace :db do
  
  desc 'Insert user into db'
  task user_data: :environment do
    User.create!(email: 'user@example.com',
                 password: 'abcd1234',
                 password_confirmation: 'abcd1234',
                 name: 'User',
                 gender: 'Male',
                 city: 'Bangalore',
                 state: 'Karnataka',
                 confirmed_at: Time.now,
                 admin: true)

    2.times do |n|
      name = Faker::Name.name
      email = "user#{n+1}@example.com"
      password = 'password'
      gender = 'Male'
      confirmed_at = Time.now
      User.create!(email: email,
                   password: password,
                   password_confirmation: password,
                   name: name,
                   gender: gender,
                   confirmed_at: confirmed_at)
    end
  end

end
