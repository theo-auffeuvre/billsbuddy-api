class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    render json: @companies, status: :ok
  end

  def show
    @company = Company.find(params[:id])
    render json: @company, status: :ok
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @company = Company.find(params[:id])
    unless @company.update(company_params)
      render json: { errors: @company.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
  end

  private

  def company_params
    params.permit(:name, :siret, :address, :city, :zip_code, :country)
  end

end