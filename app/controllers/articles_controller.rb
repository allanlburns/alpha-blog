class ArticlesController < ApplicationController
	def new
		@article = Article.new
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