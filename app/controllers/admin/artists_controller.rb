class Admin::ArtistsController < Admin::AdminController

  before_action   :find_artist, only: [:show, :update, :destroy, :edit]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show

  end

  def edit

  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.errors.empty?
      redirect_to admin_artist_path(@artist)
    else
      render "new"
    end
  end

  def update
    @artist.update_attributes(artist_params)
    if @artist.errors.empty?
      redirect_to admin_artist_path(@artist)
    else
      render "edit"
    end
  end

  def destroy
    @artist.destroy
    redirect_to action: "index"
  end

  private

  def artist_params
    params.require(:artist).permit(:singer, :description, { genre_ids: [] })
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

end
