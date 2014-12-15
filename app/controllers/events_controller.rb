class EventsController < ApplicationController
	def index

		@events = if params[:search]
      		Event.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    	elsif params[:search_location]
    		Event.near(params[:search_location], 5, units: :km)
    	elsif params[:latitude] && params[:longitude]
    		Event.near([params[:latitude], params[:longitude]], 5, units: :km)
    	else
      		Event.order('events.created_at DESC')
    	end.page(params[:page])

	    respond_to do |format|
    		format.js
      		format.html
    	end
	end
	def new
		@event = Event.new
	end
	def create
		@event = Event.new(event_params)
		# @event.categories << Category.where("id = ?", params[:category_id])

		if @event.save

			redirect_to events_url
			
		else
			render :new
		end
	end

	def show
		@event = Event.find(params[:id])
		@nearby_events = @event.nearbys(1.5, units: :km)
		@nearby_coords = @nearby_events.map {|e| {latitude: e.latitude.to_f, longitude: e.longitude.to_f}}
	end

	def edit
  		@event = Event.find(params[:id])
  	end

  	def update
  		@event = Event.find(params[:id])

  		if @event.update_attributes(event_params)
  			redirect_to event_path(@event)
  		else
  			render :edit
  		end 	
  	end

  	def destroy
  		@event = Event.find(params[:id])
  		@event.destroy
  		redirect_to events_path
  	end

	private

	def event_params
		params.require(:event).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :address, :venue, :city, :website, :image, { category_ids:[] })
		
	end
end
