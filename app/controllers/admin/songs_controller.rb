class Admin::SongsController < Admin::AdminController

  before_action   :find_song, only: [:show, :update, :destroy, :edit]
  before_action   :artists_all, only: [:new, :edit]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show

  end

  def edit

  end

  def create
    @song = Song.create(song_params)
    if @song.errors.empty?
      redirect_to admin_song_path(@song)
    else
      render "new"
    end
  end

  def update
    @song.update_attributes(song_params)
    if @song.errors.empty?
      redirect_to admin_song_path(@song)
    else
      render "edit"
    end
  end

  def destroy
    @song.destroy
    redirect_to action: "index"
  end

  private
  def song_params
    params.require(:song).permit(:album_id, :artist_id, :title, :text)
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def artists_all
    @artists = Artist.all
  end
end
