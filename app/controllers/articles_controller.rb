class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
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
		if @article.update(article_params)
			flash[:notice] = "Article successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
		# instance variable = find by id from params hash
	end

	def destroy
		@article.destroy
		flash[:notice] = "Article successfully deleted"
		redirect_to articles_path
	end

	private
		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			# needed to whitelist the params hash values
			params.require(:article).permit(:title, :description)
		end
end