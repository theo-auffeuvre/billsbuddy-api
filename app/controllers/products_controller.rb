class ProductController < ApplicationController

  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def show
    @product = Product.find(params[:id])
    render json: @product, status: :ok
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    unless @product.update(product_params)
      render json: { errors: @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.permit(:type, :designation, :qty, :unit, :price, :vat_pourcentage, :invoice_id)
  end

end