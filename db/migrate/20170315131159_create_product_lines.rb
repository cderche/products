class CreateProductLines < ActiveRecord::Migration[5.0]
  def change
    create_table :product_lines do |t|
      t.belongs_to :parent, foreign_key: true
      t.timestamps
    end
  end
end
