class CustomersController < ApplicationController

  def index
    @customers = Customer.all
    render json: @customers, status: :ok
  end

  def show
    @customer = Customer.find(params[:id])
    render json: @customer, status: :ok
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created
    else
      render json: { errors: @customer.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @customer = Customer.find(params[:id])
    unless @customer.update(customer_params)
      render json: { errors: @customer.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
  end

  private

  def customer_params
    params.permit(:name, :email, :phone, :siret, :address, :additional_address, :city, :zipcode, :country, :intracom_vat_number, :company_id)
  end

end