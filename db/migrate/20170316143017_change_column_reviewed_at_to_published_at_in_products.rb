class ChangeColumnReviewedAtToPublishedAtInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :reviewed_at, :published_at
  end
end
