class ChangeUserColumnNames < ActiveRecord::Migration
  def change
  	rename_column(:users, :crypted_password, :password)
  	rename_column(:users, :salt, :password_confirmation)
  end
end
