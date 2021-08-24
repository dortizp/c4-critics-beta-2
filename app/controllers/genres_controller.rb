class GenresController < ApplicationController
  # GET /genres
  def index
    @genres = Genre.all
  end

  # GET /genres/:id
  def show
    @genre = Genre.find(params[:id])
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/:id/edit
  def edit
    @genre = Genre.find(params[:id])
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to @genre
    else
      render :new
    end
  end

  # PATCH/PUT /genres/:id
  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      redirect_to @genre
    else
      render :edit
    end
  end

  # DELETE /genres/:id
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  private

  # Only allow a list of trusted parameters through.
  def genre_params
    params.require(:genre).permit(:name)
  end
end
