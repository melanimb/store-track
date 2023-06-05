class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]

  def index
    @sales = Sale.all
  end

  def show; end

  def new
    @sale = Sale.new
  end

  def edit; end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to sale_url(@sale), notice: 'Sale was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sale.update(sale_params)
      redirect_to sale_url(@sale), notice: 'Sale was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sale.destroy

    redirect_to sales_url, notice: 'Sale was successfully destroyed.'
  end

  private

  def set_sale
    @sale = Sale.find_by(id: params[:id])
  end

  def sale_params
    params.require(:sale).permit(:selling_price, :discount, :product_id, :client_id, :quantity)
  end
end
