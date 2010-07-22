module Sortable

  module Direction
    Descending = "DESC"
    Ascending = "ASC"
  end
  
  def sort_order(args={})
    raise "allowable_sorts is required" unless args[:allowable_sorts]
    
    default = args[:default] || args[:allowable_sorts].first
    allowable_sorts = args[:allowable_sorts]
    default_dir = args[:default_direction] || Direction::Ascending
    
    if session[:sortable_type] && session[:sortable_type].to_sym == args[:sortable_type] && session[:last_sorted_column] && session[:last_sorted_column].to_sym
      last_sort_or_default = session[:last_sorted_column].to_sym
    else
      last_sort_or_default = default
    end
    
    column = (params[:col] && allowable_sorts.include?(params[:col].to_sym)) ? params[:col] : last_sort_or_default.to_s
    
    session[:sortable_type] = args[:sortable_type]
    session[:last_sorted_column] = column

    if params[:dir]
      direction = params[:dir] == "down" ? Direction::Descending : Direction::Ascending
    else
      direction = default_dir
    end
    
    "#{column} #{direction}"
  end

end