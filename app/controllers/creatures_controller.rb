class CreaturesController < ApplicationController

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
	  redirect_to "/creatures/#{@creature.id}"
	end

	def show
		@creature = Creature.find(params.require(:id))
	end

end