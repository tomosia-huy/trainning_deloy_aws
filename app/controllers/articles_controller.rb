class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.includes(:media_articles, :user).all
    @article  = Article.new(user_id: current_user.id)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    if params[:article][:content].present? || params[:article][:article_medias].present?
      @article = Article.new(article_params)
      if @article.save
        if params[:article][:article_medias].present?
          @article.media_articles.create(media_content:  params[:article][:article_medias][:media_content])
        end
        redirect_back fallback_location: request.referrer, notice: "Article was successfully created."
      else
        redirect_back fallback_location: request.referrer, alert: @article.errors
      end
    else
      redirect_back fallback_location: request.referrer
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:content, :user_id, :media)
    end
end
