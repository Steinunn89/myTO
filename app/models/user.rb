class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  # has_secure_password
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  # validates :password, length: { minimum: 3 }
  # validates :name, :email, :presence => true
  # validates :email, :uniqueness => true



  #attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  # authenticates_with_sorcery! do |config|
  #   config.authentications_class = Authentication
  # end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
end
