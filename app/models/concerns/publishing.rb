require 'active_support/concern'

class NotAllowedError < StandardError
end

module Publishing
  extend ActiveSupport::Concern

  included do
    scope :published_all, -> { where(published_at: !nil) }
    before_save :is_published
    before_destroy :is_published
  end

  def published_at=(time)
    raise NoMethodError, "This attribute is protected"
  end

  def publish
    unless published_at?
      write_attribute(:published_at, Time.now)
      create_child
      save(validate: false)
    else
      raise NotAllowedError, "This object is already locked"
    end
  end

  private

  def is_published
    # puts "is_published: #{published_at?}"
    throw(:abort) if published_at?
    # test for Product class
    throw(:abort) if try(:product_line).try(:published_at?)
  end

end
