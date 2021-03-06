class ProductLinesController < ApplicationController
  before_action :set_product_line, except: [:index]

  def index
  end

  def show
    while @product_line.child
      @product_line = @product_line.child
    end
  end

  def publish
    respond_to do |format|
      if @product_line.publish
        format.html { redirect_to @product_line, notice: 'ProductLine was successfully published.' }
        format.json { render :show, status: :created, location: @product_line }
      else
        format.html { render :show }
        format.json { render json: @product_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_product
    respond_to do |format|
      if Product.create(product_line: @product_line)
        format.html { redirect_to @product_line, notice: 'Product was successfully added.' }
        format.json { render :show, status: :created, location: @product_line }
      else
        format.html { render :show }
        format.json { render json: @product_line.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product_line
    @product_line = ProductLine.find(params[:id])
  end
end
