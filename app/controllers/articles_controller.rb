class ArticlesController < ApplicationController

	layout 'pictures', only: [:show]

	before_action :find_article, only: [:show]

	def index
		@top_articles = Article.top(3)
		@recent_articles = Article.all
	end

	def new	
		@article = Article.new
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
	end

	private

		def find_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :user_id, :attachment, :article_long)
		end
end