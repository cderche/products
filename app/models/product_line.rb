class ProductLine < ApplicationRecord
  belongs_to :parent, class_name: ProductLine.name, foreign_key: :parent_id, optional: true
  has_one :child, class_name: ProductLine.name, foreign_key: :parent_id

  attr_reader :published_at

  def publish
    self.published_at = Time.now
  end

  private

  attr_writer :published_at
end
