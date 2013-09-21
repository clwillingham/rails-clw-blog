class Page
  include Math
  include Mongoid::Document

  has_many :posts
  field :title, type: String
  field :path, type: String
  
end