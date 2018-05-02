class Admin::AlbumsController < Admin::AdminController

  before_action   :find_album, only: [:show, :update, :destroy, :edit]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def show

  end

  def edit

  end

  def create
    @album = Album.create(album_params)
    if @album.errors.empty?
      redirect_to admin_album_path(@album)
    else
      render "new"
    end
  end

  def update
    @album.update_attributes(album_params)
    if @album.errors.empty?
      redirect_to admin_album_path(@album)
    else
      render "edit"
    end
  end

  def destroy
    @album.destroy
    redirect_to action: "index"
  end

  private

  def album_params
    params.require(:album).permit(:artist_id, :name, :year)
  end

  def find_album
    @album = Album.find(params[:id])
  end

end
