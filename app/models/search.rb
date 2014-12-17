class Search < ActiveRecord::Base

	def events
  	@events ||= find_events
	end

	private

	def find_events
  	Event.find(:all, :conditions => conditions)
	end

	def start_date_conditions
  	["events.start_date >= ?", start_date] unless start_date.blank?
	end

	def end_date_conditions
  	["events.end_date >= ?", end_date] unless end_date.blank?
	end

	def category_conditions
  	["events.category_id = ?", category_id] unless category_id.blank?
	end

	def conditions
  	[conditions_clauses.join(' AND '), *conditions_options]
	end

	def conditions_clauses
  	conditions_parts.map { |condition| condition.first }
	end

	def conditions_options
	  conditions_parts.map { |condition| condition[1..-1] }.flatten
	end

	def conditions_parts
	  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
	end
end
