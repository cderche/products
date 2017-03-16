class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :product_line, foreign_key: true
      t.belongs_to :parent, foreign_key: true
      t.datetime :reviewed_at

      t.timestamps
    end
  end
end
