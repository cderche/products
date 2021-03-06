# require 'test_helper'
#
# class ProductLineTest < ActiveSupport::TestCase
#   test "parent relationship" do
#     @child = product_lines(:child1)
#     assert_equal product_lines(:parent), @child.parent
#   end
#
#   test "child relationship" do
#     @parent = product_lines(:parent)
#     assert_equal product_lines(:child1), @parent.child
#   end
#
#   test "Can't modify published_at outside instance" do
#     @product_line = product_lines(:unpublished)
#
#     assert_raise(NoMethodError) { @product_line.published_at = Time.now }
#     assert_raise(NoMethodError) { @product_line.update_attribute(:published_at, Time.now) }
#
#   end
#
#   test "Can publish product_line" do
#     @product_line = product_lines(:unpublished)
#     assert_not @product_line.published_at?
#     @product_line.publish
#     assert @product_line.published_at?
#     assert_not_nil @product_line.child
#   end
#
#   test "Can't modify a published ProductLine" do
#     @product_line = product_lines(:published)
#     assert @product_line.published_at?
#     assert_raise(NotAllowedError) { @product_line.publish }
#   end
#
#   test "Get all children" do
#     @product_line = product_lines(:parent)
#     assert_includes @product_line.children, product_lines(:child1)
#     assert_includes @product_line.children, product_lines(:child2)
#     assert_includes @product_line.children, product_lines(:child3)
#   end
#
#   test "Get all parents" do
#     @product_line = product_lines(:child3)
#     assert_includes @product_line.parents, product_lines(:child2)
#     assert_includes @product_line.parents, product_lines(:child1)
#     assert_includes @product_line.parents, product_lines(:parent)
#   end
#
#   test "Get all products" do
#     @product_line = product_lines(:parent)
#     assert_equal Product.where(product_line: @product_line).count, @product_line.products.count
#   end
#
#   test "Child inherits parent associations" do
#     @parent = product_lines(:unpublished)
#     Product.create(product_line: @parent).publish
#     Product.create(product_line: @parent).publish
#
#     @parent.products.each do |product|
#       assert product.published_at?
#     end
#
#     assert_equal 2, @parent.products.count
#
#     @parent.publish
#     assert_equal 2, @parent.child.products.count
#   end
# end
