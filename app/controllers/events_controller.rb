class EventsController < ApplicationController
	before_filter :find_user
	def new
		@event=Event.new
		@users=User.all
		@events=@user.events
	end
	def create

		
		@event=Event.new(event_params)
		@event.owner_id=@user.id
		@event.save
		params[:role_ids].each do |f|
			@invitation=Invitation.new
			@invitation.event_id=@event.id
			@invitation.inviter_id=params[:user_id]
			@invitation.invitee_id=f
			@invitation.save
		end
		if @event.save
			redirect_to new_user_event_path
		else
			render 'new'
		end
	end
	def index
		@events=Event.all
		
	end

	def show
		@event = Event.find(params[:id])
		respond_to do | format | 
			format.js    
		end
	end
	def edit

		@event=Event.find_by_id(params[:id])
	end
	def update
		binding.pry
		@event=Event.find_by_id(params[:id])

		@event.update_attributes(event_params)
		redirect_to  new_user_event_path
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
	private
	def event_params
		params.require(:event).permit(:title,:venue,:date,:time,:description,:owner_id)
	end
	def find_user
		@user=User.find_by_id(params[:user_id])
	end
	
	
end
