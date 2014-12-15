class EventsController < ApplicationController
	def index
		if params[:tag]
			@events = Event.tagged_with(params[:tag])
		else
		 	@events = Event.all
		end
	end
	def new
		@event = Event.new
	end
	def create
		@event = Event.new(event_params)

		if @event.save

			redirect_to events_url
			
		else
			render :new
		end
	end

	def show
		@event = Event.find(params[:id])
	end


	private

	def event_params
		params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :address, :venue, :city, :website, :image, taggings_attributes: [:tag_id])
		
	end
end
