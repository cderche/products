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

  test "publish product" do
    @product = products(:unpublished)
    assert_not @product.published_at
    @product.publish
    assert @product.published_at
  end

  test "can't modify attributes of product with published product_line" do
    @product = products(:all_published)

    # Add other attributes for testing
    assert @product.product_line.published_at?
    puts "PL: #{@product.product_line.id}"

    @prev = @product.product_line
    @next = ProductLine.create

    assert_not @product.update_attribute(:product_line, @next)
    puts "PL: #{@product.product_line.id}"
    # assert_equal @prev, @product.product_line
  end
end
