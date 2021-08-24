class InvolvedCompaniesController < ApplicationController
  # GET /involved_companies
  def index
    @involved_companies = InvolvedCompany.all
  end

  # GET /involved_companies/:id
  def show
    @involved_company = InvolvedCompany.find(params[:id])
  end

  # GET /involved_companies/new
  def new
    @involved_company = InvolvedCompany.new
  end

  # GET /involved_companies/:id/edit
  def edit
    @involved_company = InvolvedCompany.find(params[:id])
  end

  # POST /involved_companies
  def create
    @involved_company = InvolvedCompany.new(involved_company_params)

    if @involved_company.save
      redirect_to @involved_company
    else
      render :new
    end
  end

  # PATCH/PUT /involved_companies/:id
  def update
    @involved_company = InvolvedCompany.find(params[:id])

    if @involved_company.update(involved_company_params)
      redirect_to @involved_company
    else
      render :edit
    end
  end

  # DELETE /involved_companies/:id
  def destroy
    @involved_company = InvolvedCompany.find(params[:id])
    @involved_company.destroy
    redirect_to involved_companies_url
  end

  private

  # Only allow a list of trusted parameters through.
  def involved_company_params
    params.require(:involved_company).permit(:game_id, :company_id, :developer, :publisher)
  end
end
