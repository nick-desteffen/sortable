module SortHelper
  
  def sort_link(options = {})
    raise "title is required" unless options[:title]
    raise "sort_column is required" unless options[:sort_column]
    raise "sortable_type is required" unless options[:sortable_type]
    
    condition = options[:unless] if options.has_key?(:unless)
    
    if session[:sortable_type] == options[:sortable_type] && session[:last_sorted_column].to_sym == options[:sort_column]
      sort_dir = params[:dir] == "up" ? "down" : "up"
    else
      sort_dir = "up"
    end

    parameters = request.parameters.merge( {:col => options[:sort_column], :dir => sort_dir} )
    parameters.delete(:commit)
    parameters.delete(:authenticity_token)

    if options[:remote] && options[:remote] == true
      link_to_remote options[:title], :url => parameters
    else
      link_to_unless condition, options[:title], parameters
    end
  end
  
end