class ProductLinesController < ApplicationController
  before_action :set_product_line

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

  private

  def set_product_line
    @product_line = ProductLine.find(params[:id])
  end
end
