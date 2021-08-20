class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def show
  end

  def index
    @article = Article.all
  end

  def new
  	@article = Article.new()
  end
  def edit
  end

  def create
  	@article = Article.new(article_params)
    @article.user = current_user
  	if @article.save
  		flash[:notice] = "Articles Saved succesfully"
  		redirect_to @article
    else
    	render 'new'
    end
  end

  def update
  	if @article.update(article_params)
  		flash[:notice] = "Articles Updated Succesfully"
  		redirect_to @article
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@article.destroy
  	redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if ( current_user != @article.user &&! current_user.admin?)
      flash[:alert] = "You can edit your's article only"
      redirect_to @article
  end
end
end