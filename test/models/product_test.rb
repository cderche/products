require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "can't destroy a product belonging to published product_line" do
    @product1 = products(:unpublished)
    @product2 = products(:published)

    @product_line = product_lines(:published)

    @product1.product_line = @product_line
    @product2.product_line = @product_line

    assert_not_nil @product_line.published_at

    assert_not @product1.destroy
    assert_not @product2.destroy
  end

  test "can't destroy a published product" do
    @product = products(:published)
    assert_not @product.destroy
  end
end
