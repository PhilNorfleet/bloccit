module Paginate
  def paginate(options)
    self.limit(options[:per_page]).offset(options[:per_page] * options[:page] )
  end
end
