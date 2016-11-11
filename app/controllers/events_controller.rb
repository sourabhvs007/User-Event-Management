class EventsController < ApplicationController
	before_filter :find_user
	def new
		@event=Event.new
	end
	def create
		@event=Event.new(event_params)
		@event.owner_id=@user.id
		@event.save
		redirect_to user_events_path
	end
	def index
		@events=Event.all
	end
	private
	def event_params
		params.require(:event).permit(:title,:venue,:date,:time,:description,:owner_id)
	end
	def find_user
		@user=User.find_by_id(params[:user_id])
	end
end
