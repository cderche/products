class AddPublishedAtToProductLines < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lines, :published_at, :datetime
  end
end
