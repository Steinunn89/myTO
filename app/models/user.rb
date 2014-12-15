class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_secure_password

  validates :password, length: { minimum: 3 }
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true
end
