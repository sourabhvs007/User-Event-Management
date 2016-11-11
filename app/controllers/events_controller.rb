class EventsController < ApplicationController
	def new
		@event=Event.new
	end
	def create
		@event=Event.new(event_params)
	end
	
end
