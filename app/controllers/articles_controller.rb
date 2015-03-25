class ArticlesController < ApplicationController

	layout 'pictures', only: [:show]

	before_action :find_article, only: [:show]

	def index
		@top_articles = Article.top(3)
		@recent_articles = Article.all
	end

	def new	
		@article = Article.new
		2.times {@article.parts.build}
	end

	def create
		@article = current_user.articles.new(article_params)

		if @article.save
			redirect_to root_url, notice: 'created article.'
		else
			render('new')
		end
	end

	def show
		@article = Article.friendly.find(params[:id])
		@parts = @article.parts.paginate(page: params[:page], per_page: 1)
	end

	private

		def find_article
			@article = Article.friendly.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :user_id, :attachment, :article_long, parts_attributes: [:part_title, :part_description])
		end
end