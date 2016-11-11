class Event < ActiveRecord::Base

	# has_many :invitees, foreign_key: :invitee_id
	# belongs_to :owner, class_name: "User"
	has_many :invitations


end
