class ArticlesController < ApplicationController
	def index
		#return all articles
		@articles = Article.all
	end

	def new
	end

	def create
		#instance variable @article becomes a new article which is passed :article as a param
		#permit means these properties can be written to
		@article = Article.new(article_params)

		@article.save

		redirect_to @article
	end

	def show
		#:id will give us the id associated with the request
		@article = Article.find(params[:id])
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end	
end
