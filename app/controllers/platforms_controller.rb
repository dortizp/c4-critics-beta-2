class PlatformsController < ApplicationController
  # GET /platforms
  def index
    @platforms = Platform.all
  end

  # GET /platforms/:id
  def show
    @platform = Platform.find(params[:id])
  end

  # GET /platforms/new
  def new
    @platform = Platform.new
  end

  # GET /platforms/:id/edit
  def edit
    @platform = Platform.find(params[:id])
  end

  # POST /platforms
  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      redirect_to @platform
    else
      render :new
    end
  end

  # PATCH/PUT /platforms/:id
  def update
    @platform = Platform.find(params[:id])

    if @platform.update(platform_params)
      redirect_to @platform
    else
      render :edit
    end
  end

  # DELETE /platforms/:id
  def destroy
    @platform = Platform.find(params[:id])
    @platform.destroy
    redirect_to platforms_url
  end

  private

  # Only allow a list of trusted parameters through.
  def platform_params
    params.require(:platform).permit(:name, :category)
  end
end
