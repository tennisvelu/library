FactoryBot.define do
    FactoryBot.use_parent_strategy = false
    factory :user do
      username { 'Testuser' }
      email { 'testuser@gmail.com' }
      password { 'password' }
      username {'testuser'}
    end
  
    factory :library do
      name { 'Library one' }
    end  
end