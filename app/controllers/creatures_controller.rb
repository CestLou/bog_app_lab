class CreaturesController < ApplicationController
	before_action :fetch_creature, only: [:show, :update, :destroy, :edit]

	def index
		@creatures = Creature.all
	end

	def creature

	end

	def new
		@creatures = Creature.new
	end

	def create
		@creature = params.require(:creature).permit(:name, :desc)
	  @creature = Creature.create(@creature)
	  redirect_to @creature
	end

	def show
		#fetch_creature
	   @search = @creature.desc
	   list = flickr.photos.search :text => @search, :sort => 'relevance'

	   @results = list.map do |photo|
	     [FlickRaw.url_m(photo),
	     FlickRaw.url_b(photo)]
	   end
	 end

	def edit
		#fetch_creature
	end

	def update
		#fetch_creature

		creature_id = params[:id]

		creature = Creature.find(creature_id)

		# get updated data
		updated_attributes = params.require(:creature).permit(:name, :desc)
		# update the creature
		creature.update_attributes(updated_attributes)

		#redirect to show
		redirect_to "/creatures/#{creature_id}"

	end

	def destroy
		#fetch_creature
		@creature.destroy
		redirect_to '/creatures'
	end

	private

		def fetch_creature
			redirect_to '/404.html' unless @creature = Creature.find_by_id(params[:id])
		end
end









