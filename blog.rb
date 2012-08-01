require_relative 'post'
require_relative 'lib/entity'

class Blog < Entity

  attr_accessor :post_source

  def initialize
    @entries = []
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news and opinion"
  end

  def add_entry entry
    @entries << entry  
  end

  def new_post attrs = {}
    post_source.call(attrs.merge(blog: self))
  end

  def entries
    @entries.sort_by(&:pubdate).reverse.take(10)
  end
end


