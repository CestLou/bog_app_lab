class CreaturesController < ApplicationController
	before_action :fetch_creature, only: [:show, :update, :destroy, :edit]

	def index
		@creature = Creature.all
	end

	def creature

	end

	def new
		@creature = Creature.new
	end

	def create
		@creature = params.require(:creature).permit(:name, :desc)
	  @creature = Creature.create(@creature)

	  if @creature.save
	  	flash[:success] = "#{@creature.name} has been saved"
	  	redirect_to @creature
	  else
	  	render :action => :new
	  end
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
		updated_attributes = params.require(:creature).permit(:name, :desc)

		@creature.update_attributes(updated_attributes)
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