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

		if @article.save
			#if save is successful, show the article that was just created
			redirect_to @article
		else 
			#otherwise use render (instead of redirect) to show the form , intact with invalid input
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
  end

	def show
		#:id will give us the id associated with the request
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		#this redirect to index
		redirect_to articles_path

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end	
end
