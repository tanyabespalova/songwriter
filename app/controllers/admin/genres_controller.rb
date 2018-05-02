class Admin::GenresController < Admin::AdminController

  before_action :find_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def show

  end

  def edit

  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.errors.empty?
      redirect_to admin_genre_path(@genre)
    else
      render "new"
    end
  end

  def update
    @genre.update_attributes(genre_params)
    if @genre.errors.empty?
      redirect_to admin_genre_path(@genre)
    else
      render "edit"
    end
  end

  def destroy
    @genre.destroy
    redirect_to action: "index"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end
