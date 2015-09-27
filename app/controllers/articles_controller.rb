class ArticlesController < ApplicationController
	#GET /articles
	def index
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		@article = Article.find(params[:id])
		#Where
		#Article.where("body LIKE ?","%hola%")
	end
	#GET /articles/new
	def new
		@article = Article.new 
	end
	def edit
		@article = Article.find(params[:id])
	end
	#POST /articles
	def create
		#INSERT INTO
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		#@article = Article.new(article_params)
		@article = current_user.articles.new(article_params)
		
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end
	#PUT /articles/:id
	def update
		#@article.update_attributes({title: "New Title"})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end
	#DELETE /articles/:id
	def destroy
		#DELETE FROM articles
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:title,:body)
	end
end