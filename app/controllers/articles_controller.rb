class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		# showing form data from params hash
		# render plain: params[:article].inspect
		# new instance variable
		@article = Article.new(article_params)
		@article.save
		# pass in the show path for that particular article
		redirect_to articles_show(@article)
	end

	private
		def article_params
			# needed to whitelist the params hash values
			params.require(:article).permit(:title, :description)
		end
end