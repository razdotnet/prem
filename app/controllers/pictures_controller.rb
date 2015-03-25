class PicturesController < ApplicationController

	layout 'pictures'

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)

		if @picture.save
			redirect_to root_url, notice: 'lol'
		else
			render('new')
		end
	end

	def show
		@picture = Picture.find(params[:id])
	end

	private

		def picture_params
			params.require(:picture).permit(:title)
		end
end