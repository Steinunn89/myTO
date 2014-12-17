class SorceryCore < ActiveRecord::Migration
def change
	add_column :users, :crypted_password, :string
	add_column :users, :salt, :string
end

  # def change
  #   create_table :users do |t|
  #     t.string :email,            :null => false
  #     t.string :crypted_password, :null => false
  #     t.string :salt,             :null => false

  #     t.timestamps
  #   end

  #   add_index :users, :email, unique: true
  # end
end