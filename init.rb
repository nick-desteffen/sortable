ActionView::Base.send :include, SortHelper
ActionController::Base.send :include, Sortable
ActiveRecord::Base.send :include, SortableColumns