class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :page
  field :title, type: String
  field :body, type: String

end