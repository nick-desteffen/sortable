require 'test_helper'
require 'action_controller'
require 'action_controller/test_process'

ActionController::Routing::Routes.draw do |map|
  map.connect 'sortable', :controller => 'sortable', :action => "index"
end

class SortableController < ActionController::Base
  def index
  end
end

class SortHelperTest < ActionController::TestCase
  include SortHelper

  def setup
    @controller = SortableController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_sort_link
    get :index
    assert_equal "<a href=\"http://www.google.com\">Facility Name</a>", sort_link(:title => "Facility Name", :sort_column => :name, :sortable_type => :help_request)
  end

end