namespace :update_users do
  task :random_pwd_nil => :environment do
    User.where(is_random_pwd: nil).update_all(is_random_pwd: false)
  end
end
  



