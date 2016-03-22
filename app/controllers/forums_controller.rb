class ForumsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_forum, except: [:index, :new, :create]

	def index
		@forums = Forum.all
	end
	def show
		@forum.update_visits_count
	end
	def new
		@forum = Forum.new
	end
	def edit
		
	end
	def create
		@forum = current_user.forums.new(forum_params)
		if @forum.save
		redirect_to @forum
		else
			render :new
		end
	end
	
	def destroy
		
		@forum.destroy
		redirect_to forums_path		
	end
	def update
		
		if @forum.update(forum_params)
			redirect_to @forum
		else
			render :edit
		end
	end

	private 
	def set_forum
		@forum = Forum.find(params[:id])
	end

	def forum_params
		params.require(:forum).permit(:slogan, :presentacion, :hora)
	end
end