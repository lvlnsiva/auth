class UpdateIsRandomPwdToUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :is_random_pwd, false)
  end
end
