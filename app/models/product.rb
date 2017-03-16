class Product < ApplicationRecord
  include LinkedList
  include Publishing

  belongs_to :product_line

end
