require 'test_helper'

class ProductLineTest < ActiveSupport::TestCase
  test "parent relationship" do
    @child = product_lines(:child)
    assert_equal product_lines(:parent), @child.parent
  end

  test "child relationship" do
    @parent = product_lines(:parent)
    assert_equal product_lines(:child), @parent.child
  end

  test "Can't modify published_at outside instance" do
    @product_line = product_lines(:one)

    assert_raise(NoMethodError) do
      @product_line.published_at = Time.now
      @product_line.update_attribute(published_at: Time.now)
    end

  end

  test "Can modify published_at using publish method" do
    @product_line = product_lines(:one)
    assert_nil @product_line.published_at
    @product_line.publish
    assert_not_nil @product_line.published_at
  end
end
