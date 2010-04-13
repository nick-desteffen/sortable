require 'test_helper'
require 'active_record'

class SortableModel < ActiveRecord::Base
  
  attr_accessor :name, :display_date, :non_sortable_attribute
  sortable_columns [:name, :display_date]
  
end

class NonSortableModel < ActiveRecord::Base
  
  attr_accessor :name, :display_date
  
end

class SortableColumnsTest < Test::Unit::TestCase

  def test_should_have_array_of_allowable_sorts
    assert_equal [:name, :display_date], SortableModel.sorts
  end

  def test_should_not_have_array_of_allowable_sorts
    assert !NonSortableModel.respond_to?(:sorts)
  end
  
  def test_should_have_named_scope_ordered
    assert SortableModel.respond_to?(:ordered)
  end
  
  def test_should_not_have_named_scope_ordered
    assert !NonSortableModel.respond_to?(:ordered)
  end
  
end
