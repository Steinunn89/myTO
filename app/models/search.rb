class Search < ActiveRecord::Base


	def events
  	@events ||= find_events
	end

	private

	def find_events
  	events = Event.order(:name)
  	events = events.where('start_date >= ?', start_date) if start_date.present?
  	events = events.where('end_date >= ?', end_date) if end_date.present?
  	events = events.where(category_id: category_id) if category_id.present?
  	events
	end

	
end
