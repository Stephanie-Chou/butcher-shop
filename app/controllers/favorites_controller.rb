class FavoritesController < ApplicationController
  respond_to :json
  before_filter :find_user

  def index
    @favorites = Favorite.all
    respond_with @favorites
  end

  def create
    @favorite = Favorite.create favorite_params
    respond_with @favorite
  end

  def show
    respond_with @favorite
  end

  def update
    @favorite.update_attributes favorite_params
    respond_with @favorite
  end

  def destroy
    @favorite.destroy
    head 204
  end

  protected
    def find_favorite
      @favorite = Favorite.find params[:id]
    rescue ActiveRecord::RecordNotFound
      head 404
    end

    def find_user
      @user = User.find params[:user_id]
    rescue ActiveRecord::RecordNotFound
      head 404
    end

    def favorite_params
      params.require(:favorite).permit(:user_id, :cut_id)
    end
end
