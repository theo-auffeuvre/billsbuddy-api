class DeliveryAddressesController < ApplicationController

  def index
    @delivery_addresses = DeliveryAddress.all
    render json: @delivery_addresses, status: :ok
  end

  def show
    @delivery_address = DeliveryAddress.find(params[:id])
    render json: @delivery_address, status: :ok
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    if @delivery_address.save
      render json: @delivery_address, status: :created
    else
      render json: { errors: @delivery_address.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    unless @delivery_address.update(delivery_address_params)
      render json: { errors: @delivery_address.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
  end

  private

  def delivery_address_params
    params.permit(:address, :city, :zipcode, :country, :invoice_id)
  end

end