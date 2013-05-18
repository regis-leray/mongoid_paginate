class Document
  include Mongoid::Document
  include Mongoid::Paginate
  field :name, :type => String

  paginate(per_page: 15)
end

class DefaultDocument
  include Mongoid::Document
  include Mongoid::Paginate
  field :name, :type => String

  paginate
end