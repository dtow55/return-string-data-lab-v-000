class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])
    val = false
    if !!@product.inventory && (@product.inventory > 0)
      val = true
    end
    render plain: val
  end

  private

  def product_params
    params[:product].permit(:name, :price, :inventory, :description)
  end

end
