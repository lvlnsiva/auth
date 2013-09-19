class AddIsRandomPwdToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_random_pwd, :boolean
  end
end
