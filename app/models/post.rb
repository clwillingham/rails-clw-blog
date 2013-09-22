class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :page
  belongs_to :user
  field :title, type: String
  field :body, type: String
  field :show_date, type: Boolean, default: false

end