class NotAllowedError < StandardError
end

class ProductLine < ApplicationRecord
  belongs_to :parent, class_name: ProductLine.name, foreign_key: :parent_id, optional: true
  has_one :child, class_name: ProductLine.name, foreign_key: :parent_id
  # has_many :children, class_name: ProductLine.name,

  scope :parents_all, -> { where(parent: nil) }
  scope :published, -> { where(published_at: !nil) }

  before_validation :is_locked_callback

  # only the publish method should modify published_at
  def published_at=(time)
    raise NoMethodError, "This attribute is protected"
  end

  def publish
    unless published_at?
      write_attribute(:published_at, Time.now)
      save(validate: false)
      create_child
    else
      raise NotAllowedError, "This object is already locked"
    end
  end

  def children
    array = []
    tmp = self.try(:child)
    while tmp
      array << tmp
      tmp = tmp.child
    end
    return array
  end

  def parents
    array = []
    tmp = self.try(:parent)
    while tmp
      array << tmp
      tmp = tmp.parent
    end
    return array
  end

  private

  def is_locked_callback
    puts "is_locked_callback"
    throw(:abort) if self.published_at?
  end

  def create_child
    child = ProductLine.new(parent: self)
    # Add all attributes (except published_at)
    # Add all associations
    child.save
  end
end
