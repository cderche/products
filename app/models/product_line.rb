# class NotAllowedError < StandardError
# end

class ProductLine < ApplicationRecord
  include LinkedList
  include Publishing

  has_many :products
  
end
