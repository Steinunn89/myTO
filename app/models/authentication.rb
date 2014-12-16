class Authentication < ActiveRecord::Base
	#attr_accessible :user_id, :provider, :uid
  belongs_to :user

  def self.find_by_provider_and_uid(provider, uid)
  	where(provider: provider, uid: uid).first
	end
end
