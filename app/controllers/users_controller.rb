class UsersController < ApplicationController
	def new
		@user=User.new
	end
	def create
		@user=User.new(user_params)
		if @user.save
			redirect_to welcome_path, flash[:success] = "User Created successfully !"
		  else
		    render 'new', flash[:error] = "Something went wrong."
		  end
	end
	def index
		@users=User.all
	end
	def edit
		@user=User.find_by_id(params[:id])
		
	end
	def update
		@user=User.find_by_id(params[:id])
		@user.update_attributes(user_params)
		redirect_to user_path
	end
	def show
		@user=User.find_by_id(params[:id])
	end
	def destroy
		@user=User.find_by_id(params[:id])
		@user.destroy
		redirect_to welcome_path, flash[:success] = "Account Deleted successfully !!"
	end
	private
	def user_params
		params.require(:user).permit(:fname,:lname,:email,:username,:phone,:password)
	end

end
