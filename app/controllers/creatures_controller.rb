class CreaturesController < ApplicationController
	before_action :fetch_creature, only: [:show, :update]

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
	  redirect_to "/creatures/#{creature.id}"
	  # redirect_to @creature
	end

	def show

	end

	def update

	end

	def destroy

	end

	private

		def fetch_creature
			@creature = Creature.find(params.require[:id])
		end

end