class Event < ActiveRecord::Base
	geocoded_by :full_address
	after_validation :geocode, if: :address_changed?

	def full_address
		# if address.include?('Toronto')
		# 	full_address = address
		# else
			city = "Toronto"
			full_address = address + ", " + city
		# end
	end

	def check_time
		if time.include("-")
			start_time = time.parse("-") #whatever's before
			end_time = time.parse("-")

		elsif time = "All Day" || "all day" || "All day"
			start_time = "12:00 AM"
			end_tim = '11:59 PM'
		else
			start_time = time
		end
	end

end
