class GamesController < ApplicationController
  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/:id
  def show
    @game = Game.find(params[:id])
  end

  # GET /games/new
  def new
    @game = Game.new
    @main_games = Game.main_game
  end

  # GET /games/:id/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  # PATCH/PUT /games/:id
  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  # DELETE /games/:id
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url
  end

  # Custom Routes

  # POST /games/:id/add_genre
  def add_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])

    game.genres << genre
    redirect_to game
  end

  # DELETE /games/:id/remove_genre
  def remove_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])

    game.genres.delete(genre)
    redirect_to game
  end

  # POST /games/:id/add_platform
  def add_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])

    game.platforms << platform
    redirect_to game
  end

  # DELETE /games/:id/remove_platform
  def remove_platform
    game = Game.find(params[:id])
    platform = Platform.find(params[:platform_id])

    game.platforms.delete(platform)
    redirect_to game
  end

  private

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id)
  end
end
