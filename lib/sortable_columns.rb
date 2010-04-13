module SortableColumns
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def sortable_columns(allowable_sorts = [])
      cattr_accessor :sorts
      self.sorts = allowable_sorts
      self.class_eval do
        named_scope :ordered, lambda{ |order_clause| {:order => order_clause} }
      end
    end
  end

end
