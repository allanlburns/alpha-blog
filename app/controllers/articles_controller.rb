class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		# showing form data from params hash
		# render plain: params[:article].inspect
		# new instance variable
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article sucessfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def update
		# article instance variable = find by id from params hash
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article sucessfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
		# instance variable = find by id from params hash
		@article = Article.find(params[:id])
	end

	private
		def article_params
			# needed to whitelist the params hash values
			params.require(:article).permit(:title, :description)
		end
end