class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
    render json: @invoices, status: :ok
  end

  def show
    @invoice = Invoice.find(params[:id])
    render json: @invoice, status: :ok
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      render json: @invoice, status: :created
    else
      render json: { errors: @invoice.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    unless @invoice.update(invoice_params)
      render json: { errors: @invoice.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
  end

  private

  def invoice_params
    params.permit(:title, :issue_date, :payment_due, :customer_id)
  end

end