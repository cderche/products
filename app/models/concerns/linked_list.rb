require 'active_support/concern'

module LinkedList

  extend ActiveSupport::Concern

  included do
    belongs_to :parent, class_name: name, foreign_key: :parent_id, optional: true
    has_one :child, class_name: name, foreign_key: :parent_id

    scope :parents_all, -> { where(parent: nil) }
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

  def create_child
    child = self.class.new(parent: self)
    # Add all attributes (except published_at)
    # Add all associations
    child.save
  end

end
